package es.tmoor.eerover

import javax.imageio.ImageIO
import java.io.File
import java.awt.Color
import java.awt.image.BufferedImage
import java.awt.Image
import util.Try
import scala.collection.mutable.ListBuffer

case class TestImg(file: String) extends BufferedImage(640,480,Image.SCALE_DEFAULT) {

  Try (
    getGraphics
      .drawImage(ImageIO.read(new File(s"detect/images/$file.jpg"))
      .getScaledInstance(640,480,Image.SCALE_DEFAULT),0,0,null)
  ) orElse (
    sys.error(s"Failed to load $file")
  )

  println(s"Loaded $file")

  
  def nBrightest(i: Int) = {
    val image = new BufferedImage(640,480,BufferedImage.TYPE_INT_RGB)
    for (y <- 0 until 480) {
      val pixels = ListBuffer[(Int,(Int,Int),Color)]()
      for (x <- 0 until 640) {
        val colour = new Color(getRGB(x,y))
        pixels += ((colour.getRed + colour.getBlue + colour.getGreen, (x,y), colour))
      }
      pixels.sortBy(-_._1).take(i).foreach { case (_,(x,y),c) => image.setRGB(x,y,c.getRGB)}
    }

    val outFile = new File(s"detect/outputs/${file}_brightest.png")
    ImageIO.write(image, "png", outFile)
  }


  def colours = {
    val image = new BufferedImage(640,480,BufferedImage.TYPE_INT_RGB)

    def scale(c: Color): Color = {
      val r = c.getRed
      val g = c.getGreen
      val b = c.getBlue
      val max: Double = 255d / math.max(math.max(r,g),b)
      new Color((r*max).toInt, (g*max).toInt, (b*max).toInt)
    }

    val green = new Color(45,213,92)
    val orange = new Color(154,130,8)
    val blue = new Color(1,105,192)
    val pink = new Color(66,70,108)
    val black = new Color(7,30,48)

    println(s"green: ${scale(green)}")
    println(s"orange: ${scale(orange)}")
    println(s"blue: ${scale(blue)}")
    println(s"pink: ${scale(pink)}")
    println(s"black: ${scale(black)}")

    val setNil = new Color(0,0,0)
    val setGreen = new Color(0,255,0)
    val setOrange = new Color(255,255,0)
    val setBlue = new Color(0,0,255)
    val setPink = new Color(255,0,255)
    val setBlack = new Color(255,255,255)

    def getDiff(c1: Color, c2: Color): (Int,Int,Int) = {
      val a = scale(c1)
      val b = scale(c2)
      (math.abs(a.getRed - b.getRed),
       math.abs(a.getGreen - b.getGreen),
       math.abs(a.getBlue - b.getBlue))
    }

    def total(i: (Int, Int, Int)) = i._1+i._2+i._3

    val t1 = 32
    val t2 = 56
    val tBlue = 96

    def min(a: (Int,Int,Int)*) = {
      val flt = a.filter{case (r,g,b) => r < t1 && g < t1 && b < t1}
      flt.zip(flt.map(total(_))).sortBy(_._2).headOption.getOrElse(((0,0,0),0))._1
    }
    
    var l1 = setNil

    var g1 = -1
    var g2 = -1
    var o1 = -1
    var o2 = -1
    var bl1 = -1
    var bl2 = -1
    var p1 = -1
    var p2 = -1
    var bk1 = -1
    var bk2 = -1

    def setMin(c1: Color): (Color, Color) = {
      val th = c1.getRed + c1.getGreen + c1.getBlue
      if (th > t2) {
        val gr = getDiff(green,c1)
        val or = getDiff(orange,c1)
        val bl = getDiff(blue,c1)
        val pn = getDiff(pink,c1)
        val bk = getDiff(black,c1)
        
        min(gr,or,bl,pn,bk) match {
          case `gr` if l1 == setGreen => (setGreen, setGreen)
          case `gr` => (setNil, setGreen)
          case `or` if l1 == setOrange => (setOrange,setOrange)
          case `or` => (setNil, setOrange)
          case `bl` if l1 == setBlack || l1 == setBlue => (setBlue,setBlue)
          //case `bl` if l1 == setBlack => (setBlack,setBlack)
          //case `bl` if th <= tBlue => (setNil, setBlack)
          case `bl` => (setNil, setBlue)
          case `pn` if l1 == setPink => (setPink,setPink)
          case `pn` => (setNil, setPink)
          //case `bk` if l1 == setBlue => (setBlue,setBlue)
          case `bk` if l1 == setBlack || l1 == setBlue => (setBlack,setBlack)
          //case `bk` if th > tBlue => (setNil, setBlue)
          case `bk` => (setNil, setBlack)
          case _ => (setNil,setNil)
        }
        
      } else (setNil,setNil)
    }

    for (y <- 320 until 480) {
      o1 = -1; o2 = -1
      g1 = -1; g2 = -1
      bl1= -1; bl2= -1
      p1 = -1; p2 = -1
      bk1= -1; bk2= -1
      for (x <- 0 until 640) {
        val (colour,nL1) = setMin(new Color(getRGB(x,y)))
        colour match {
          case `setOrange` => {
            if (o1 == -1) o1 = x
            o2 = x
          }
          case `setGreen` => {
            if (g1 == -1) g1 = x
            g2 = x
          }
          case `setBlue` => {
            if (bl1 == -1) bl1 = x
            bl2 = x
          }
          case `setPink` => {
            if (p1 == -1) p1 = x
            p2 = x
          }
          case `setBlack` => {
            if (bk1 == -1) bk1 = x
            bk2 = x
          }
          case _ => 
        }
        l1 = nL1
      }
      if (o1 != -1) image.setRGB(o1,y,setOrange.getRGB)
      if (o2 != -1) image.setRGB(o2,y,setOrange.getRGB)
      if (g1 != -1) image.setRGB(g1,y,setGreen.getRGB)
      if (g2 != -1) image.setRGB(g2,y,setGreen.getRGB)
      if (bl1 != -1) image.setRGB(bl1,y,setBlue.getRGB)
      if (bl2 != -1) image.setRGB(bl2,y,setBlue.getRGB)
      if (p1 != -1) image.setRGB(p1,y,setPink.getRGB)
      if (p2 != -1) image.setRGB(p2,y,setPink.getRGB)
      if (bk1 != -1) image.setRGB(bk1,y,setBlack.getRGB)
      if (bk2 != -1) image.setRGB(bk2,y,setBlack.getRGB)
      
    }

    val outFile = new File(s"detect/outputs/${file}.png")
    ImageIO.write(image, "png", outFile)
  }

}
