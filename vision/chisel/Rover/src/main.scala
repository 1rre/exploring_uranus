import chisel3.stage.ChiselStage
import rover.edgedetect.EdgeDetect

object Main extends App {
  (new ChiselStage).emitVerilog(new EdgeDetect)
}