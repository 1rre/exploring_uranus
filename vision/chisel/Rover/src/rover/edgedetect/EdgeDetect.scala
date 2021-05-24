package rover.edgedetect

import chisel3._
import chisel3.util.Cat



class EdgeDetect extends Module {
  def uInt(i: Int) = UInt(i.W)
  def sInt(i: Int) = SInt(i.W)
  def uReg(i: Int) = Reg(uInt(i))
  def sReg(i: Int) = Reg(sInt(i))

  class EdgeDetectIO extends Bundle {
    val x, y = Input(uInt(11))
    val px_in = Input(new RGB)
    val px_out = Output(new RGB)
    val line_sync = Input(Bool())
  }
  
  class RGB extends Bundle {
    val r = uInt(8)
    val g = uInt(8)
    val b = uInt(8)
  }

  val io = IO(new EdgeDetectIO)
  
  import io._

  val px_buffer = RegNext(WireInit(Vec(640, new RGB), DontCare))
  val last_px = RegNext(WireInit(new RGB, DontCare))

  val dh, dv = Array.tabulate(3)(_ => sReg(9))
  val abs_dh, abs_dv, abs_d = Wire(new RGB)

  abs_dh.r := dh(0).abs.asUInt.tail(1)
  abs_dv.r := dv(0).abs.asUInt.tail(1)
  abs_d.r := (abs_dh.r +& abs_dv.r)>>1
  px_out.r := Mux(abs_d.r > 0xff.U,0xff.U(8),abs_d.r)  

  abs_dh.g := dh(1).abs.asUInt.tail(1)
  abs_dv.g := dv(1).abs.asUInt.tail(1)
  abs_d.g := (abs_dh.g +& abs_dv.g)>>1
  px_out.g := Mux(abs_d.g > 0xff.U,0xff.U(8),abs_d.g)

  abs_dh.b := dh(2).abs.asUInt.tail(1)
  abs_dv.b := dv(2).abs.asUInt.tail(1)
  abs_d.b := (abs_dh.b +& abs_dv.b)>>1
  px_out.b := abs_d.g

  withClock(clock) {
    when(x >= 1.U) {
      dh(0) := (Cat(0.U(1), (px_buffer(x-1.U).r)).asSInt - Cat(0.U(1), px_in.r).asSInt)
      dv(0) := (Cat(0.U(1), (px_buffer(x).r)).asSInt - Cat(0.U(1), last_px.r).asSInt)
      dh(1) := (Cat(0.U(1), (px_buffer(x-1.U).g)).asSInt - Cat(0.U(1), px_in.g).asSInt)
      dv(1) := (Cat(0.U(1), (px_buffer(x).g)).asSInt - Cat(0.U(1), last_px.g).asSInt)
      dh(2) := (Cat(0.U(1), (px_buffer(x-1.U).b)).asSInt - Cat(0.U(1), px_in.b).asSInt)
      dv(2) := (Cat(0.U(1), (px_buffer(x).b)).asSInt - Cat(0.U(1), last_px.b).asSInt)
    }
    px_buffer(x) :=  last_px
    last_px := px_in
  }

  

}