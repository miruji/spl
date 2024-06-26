#
  packet kit for ArchLinux

packitString = "\fg(#ffffff)\bpackit:\c "

? argc = 0
  println(packitString+"No arguments\c")
  exit(0)

#
# packit version
? argv[0] = "v"
  println(packitString+"Version 0.1.0")
#
# Synchronize package (update/download)
? argv[0] = "s"
  target
  ? argc < 2
    target = ""
  ?
    target = argv[1]
  println(packitString+"Synchronize package '"+target+"'")
  
  ? argc = 2
    exec("sudo pacman --noconfirm -S archlinux-keyring")
    exec("sudo pacman --noconfirm -S "+target)
  ?
    println(packitString+"Requires 2nd parameter as target")
# Synchronize all packages
? argv[0] = "sa"
  println(packitString+"Synchronize all packages")
  exec("sudo pacman --noconfirm -S archlinux-keyring")
  exec("sudo pacman --noconfirm -Syu")
#
# Remove package
? argv[0] = "r"
  target
  ? argc < 2
    target = ""
  ?
    target = argv[1]
  println(packitString+"Remove package '"+target+"'")
  
  ? argc = 2
    exec("sudo pacman --noconfirm -Rdd"+target)
  ?
    println(packitString+"Requires 2nd parameter as target")
# Remove package with dependencies
? argv[0] = "rd"
  target
  ? argc < 2
    target = ""
  ?
    target = argv[1]
  println(packitString+"Remove package '"+target+"' with dependencies")
  
  ? argc = 2
    exec("sudo pacman --noconfirm -Rddn "+target)
  ?
    println("Requires 2nd parameter as target")
# Remove package with dependencies, configuration
? argv[0] = "rdc"
  target
  ? argc < 2
    target = ""
  ?
    target = argv[1]
  println(packitString+"Remove package '"+target+"' with dependencies, configuration")
  
  ? argc = 2
    exec("sudo pacman --noconfirm -Rddns "+target)
  ?
    println("Requires 2nd parameter as target")
#
# Litter packages
? argv[0] = "l"
  println(packitString+"Show litter packages")
  exec("pacman -Qdtq")
# Clear litter packages
? argv[0] = "lc"
  println(packitString+"Clear litter packages")
  exec("sudo pacman --noconfirm -Rdd $(pacman -Qdtq)")
  # todo: Check litter list
#
# Clear cache, leaving latest
? argv[0] = "c"
  println(packitString+"Clear cache, leaving latest")
  exec("sudo pacman --noconfirm -Sc")
# clear cache all
? argv[0] = "ca"
  println(packitString+"Clear cache, all")
  exec("sudo pacman --noconfirm -Scc")
#
# Bad command
?
  println(packitString+"bad command, no work")
  exit(1)

println(packitString+"Successful completion")