package es.tmoor.eerover

import javax.imageio.ImageIO
import java.io.File
import java.awt.Color
import java.awt.image.BufferedImage
import java.awt.Image
import util.Try

case class TestImg(file: String) extends BufferedImage(640,480,Image.SCALE_DEFAULT) {

  Try (
    getGraphics
      .drawImage(ImageIO.read(new File(s"detect/images/$file.jpg"))
      .getScaledInstance(640,480,Image.SCALE_DEFAULT),0,0,null)
  ) orElse (
    sys.error(s"Failed to load $file")
  )

  println(s"Loaded $file")

  


  def colours = {
    val image = new BufferedImage(640,480,BufferedImage.TYPE_INT_RGB)

    def scale(c: Color): Color = {
      val r = c.getRed
      val g = c.getGreen
      val b = c.getBlue
      val max: Double = 255d / math.max(math.max(r,g),b)
      new Color((r*max).toInt, (g*max).toInt, (b*max).toInt)
    }

    def green = new Color(45,213,92)
    def orange = new Color(154,130,8)
    def blue = new Color(1,105,192)
    def pink = new Color(66,70,108)
    def black = new Color(0,25,42)


    def t1 = 64
    def t2 = 64

    def is(c1: Color, c2: Color): Boolean = {
      c1.getRed + c1.getGreen + c1.getBlue > t2 &&
      c2.getRed + c2.getGreen + c2.getBlue > t2 && {
        val a = scale(c1)
        val b = scale(c2)
        math.abs(a.getRed - b.getRed) < t1 &&
        math.abs(a.getGreen - b.getGreen) < t1 &&
        math.abs(a.getBlue - b.getBlue) < t1
      }
    }

    
    for (y <- 320 until 480; x <- 0 until 640) {
      val colour = new Color(getRGB(x,y))
      if (is(green, colour)) image.setRGB(x,y,new Color(0,255,0).getRGB)
      else if (is(orange, colour)) image.setRGB(x,y,new Color(255,255,0).getRGB)
      else if (is(blue, colour)) image.setRGB(x,y,new Color(0,0,255).getRGB)
      else if (is(pink, colour)) image.setRGB(x,y,new Color(255,0,255).getRGB)
      else if (is(black, colour)) image.setRGB(x,y,new Color(255,255,255).getRGB)
      else image.setRGB(x,y,new Color(0,0,0).getRGB)
    }

    val outFile = new File(s"detect/outputs/${file}.jpg")
    ImageIO.write(image, "jpg", outFile)
  }

}
