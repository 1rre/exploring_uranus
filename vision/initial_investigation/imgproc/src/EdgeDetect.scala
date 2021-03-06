package es.tmoor.eerover

import javax.imageio.ImageIO
import java.io.File
import java.awt.Color
import java.awt.image.BufferedImage
import java.awt.Image


object EdgeDetect {
  class Matrix (elems:Double*) {
    val map = {
      val w = math.sqrt(elems.length).toInt / 2
      val coords = for (i <- -w to w; j <- -w to w) yield (i,j)
      coords.zip(elems).toMap
    }
    def pixels = map.keys
    def apply(x: Int, y: Int) = map((x,y))
  }

  def diff1(a: Double, b: Double) = new Matrix (
    a, 0d, -a,
    b, 0d, -b,
    a, 0d, -a
  )
  
  def diff2(a: Double, b: Double) = new Matrix (
     a,  b,  a,
    0d, 0d, 0d,
    -a, -b, -a
  )

  val diffH = diff1(0.75, 1.5)
  
  val diffV = diff2(0.75, 1.5)
  
  val im1 = {
    val out = new BufferedImage(640,480,BufferedImage.TYPE_INT_ARGB)
    val file = new File("ingenuity_3.0.jpg")
    
    out.getGraphics.drawImage (
      ImageIO.read(file).getScaledInstance(640,480,Image.SCALE_DEFAULT),
      0,0,null)
    out
  }
  
  val w = im1.getWidth
  val h = im1.getHeight
  
  val im2 = new BufferedImage(w,h,BufferedImage.TYPE_BYTE_GRAY)
  
  for (x <- 1 until w; y <- 1 until h) {
    var c1 = Array(0d,0d,0d)
    var c2 = Array(0d,0d,0d)
    for ((i,j) <- mat1.pixels if (0 until w contains (x+i)) && (0 until h contains (y+j))) {
      val _px = new Color(img.getRGB(x+i,y+j))
      var px = Array(_px.getRed, _px.getBlue, _px.getGreen)
      for ((col, b) <- c1.zip(px)) {
        col = 5
      }
      c2 += (c * mat2(i,j))
    }
    val c: Int = min(255,((abs(c1)+abs(c2))/2).toInt)
    val col = new Color(c,c,c)
    im2.setRGB(x,y,col.getRGB)
  }
  val outFile = new File("ingenuity_bw.jpg")
  ImageIO.write(im2, "jpg", outFile)
  
}