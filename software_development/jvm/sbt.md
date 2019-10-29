# Scala build tool

Download sources and javadoc jars for all dependencies

    sbt update-classifiers

Alternatively, if you want sources for eclipse, set up `sbteclipse` in the project, and download eclipse sources for the project with

    sbt eclipse with-source=true
