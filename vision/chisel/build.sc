import mill._, scalalib._

object Rover extends ScalaModule {
  def scalaVersion = "2.12.10"
  def ivyDeps = Agg (
    ivy"edu.berkeley.cs:chisel3_2.12:3.4.3"
  )
}