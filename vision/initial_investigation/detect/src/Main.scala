package  es.tmoor.eerover

object Main extends App {
  println("Hello World!")

  val image = TestImg(args.headOption.getOrElse("bdroom_light_behind_camera"))
  image.colours
}