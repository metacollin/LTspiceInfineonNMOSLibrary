# Quick and dirty mosfet symbol generator script

# Author: metacollin <metacollin@electropi.mp>
# Date: January 17 2021
# Version: 0.1

# === Description ===
# It generates .asy symbol files for n_channel mosfets from spice libs from Infineon
# Dear Infineon: please don't sue me, this will make more people buy your FETs

# === Program Usage ===
# usage: mosfet_conv.rb spice_lib.lib [spice_lib_1.lib ... spice_lib_n.lib]


require 'fileutils'
require 'warning'

Warning.ignore(//, //)

ARGV.each do |arg|
  if File.file? arg
    library = IO.read(arg).force_encoding("ISO-8859-1").encode("utf-8", replace: nil)
    is_pmos = false
    if arg["pmos"] == "pmos" or library["p-channel"] == "p-channel"
      is_pmos = true
    end

    if is_pmos == true
      polarity = <<~EOF
        LINE Normal 16 48 24 48
        LINE Normal 48 48 24 44
        LINE Normal 48 48 24 52
        LINE Normal 24 44 24 52
        EOF
    else
        polarity = <<~EOF
        LINE Normal 40 48 48 48
        LINE Normal 16 48 40 44
        LINE Normal 16 48 40 52
        LINE Normal 40 44 40 52
        EOF
    end

    polarity.strip!
   
    parts_L0 = library.scan /\.SUBCKT (.+_L0)\s+drain\s+gate\s+source/
    parts_L1 = library.scan /\.SUBCKT (.+_L1)\s+drain\s+gate\s+source(?! Tj)/
    parts_L2 = library.scan /\.SUBCKT (.+_L2)\s+drain\s+gate\s+source\s+Tj\s+Tcase/
    parts_L2_alt = library.scan /\.SUBCKT (.+)(?<!L[0-3])\s+drain\s+gate\s+source\s+Tj\s+Tcase/
    parts_L3 = library.scan /\.SUBCKT (.+_L3)\s+drain\s+gate\s+source\s+Tj\s+Tcase/

    unless is_pmos == true
      libname = File.basename(arg, ".*")
    else
      libname = "pmos/#{File.basename(arg, ".*")}"
    end


    FileUtils.mkdir_p ("#{libname}_symbols")

    parts_L2.each do |part|
      L2 = <<~EOF
        Version 4
        SymbolType CELL
        LINE Normal 48 48 48 96
        LINE Normal 16 80 48 80
        #{polarity}
        LINE Normal 16 8 16 24
        LINE Normal 16 40 16 56
        LINE Normal 16 72 16 88
        LINE Normal 0 80 8 80
        LINE Normal 8 16 8 80
        LINE Normal 48 16 16 16
        LINE Normal 48 0 48 16
        WINDOW 0 56 32 Left 2
        WINDOW 3 56 72 Left 2
        SYMATTR Value #{part[0]}
        SYMATTR Prefix X
        SYMATTR ModelFile #{libname}.lib
        SYMATTR Description #{is_pmos ? "P" : "N"}-Channel MOSFET transistor
        PIN 48 0 NONE 0
        PINATTR PinName D
        PINATTR SpiceOrder 1
        PIN 0 80 NONE 0
        PINATTR PinName G
        PINATTR SpiceOrder 2
        PIN 48 96 NONE 0
        PINATTR PinName S
        PINATTR SpiceOrder 3
        PIN 80 -16 LEFT 8
        PINATTR PinName Tj
        PINATTR SpiceOrder 4
        PIN 80 112 LEFT 8
        PINATTR PinName Tcase
        PINATTR SpiceOrder 5
      EOF

      File.open("#{libname}_symbols/#{part[0]}.asy", "w") do |f|     
        f.write(L2)   
      end
    end

    parts_L2_alt.each do |part|
      L2_alt = <<~EOF
        Version 4
        SymbolType CELL
        LINE Normal 48 48 48 96
        LINE Normal 16 80 48 80
        #{polarity}
        LINE Normal 16 8 16 24
        LINE Normal 16 40 16 56
        LINE Normal 16 72 16 88
        LINE Normal 0 80 8 80
        LINE Normal 8 16 8 80
        LINE Normal 48 16 16 16
        LINE Normal 48 0 48 16
        WINDOW 0 56 32 Left 2
        WINDOW 3 56 72 Left 2
        SYMATTR Value #{part[0]}
        SYMATTR Prefix X
        SYMATTR ModelFile #{libname}.lib
        SYMATTR Description #{is_pmos ? "P" : "N"}-Channel MOSFET transistor
        PIN 48 0 NONE 0
        PINATTR PinName D
        PINATTR SpiceOrder 1
        PIN 0 80 NONE 0
        PINATTR PinName G
        PINATTR SpiceOrder 2
        PIN 48 96 NONE 0
        PINATTR PinName S
        PINATTR SpiceOrder 3
        PIN 80 -16 LEFT 8
        PINATTR PinName Tj
        PINATTR SpiceOrder 4
        PIN 80 112 LEFT 8
        PINATTR PinName Tcase
        PINATTR SpiceOrder 5
      EOF

      File.open("#{libname}_symbols/#{part[0]}.asy", "w") do |f|     
        f.write(L2_alt)   
      end
    end


    parts_L3.each do |part|
      L3 = <<~EOF
        Version 4
        SymbolType CELL
        LINE Normal 48 48 48 96
        LINE Normal 16 80 48 80
        #{polarity}
        LINE Normal 16 8 16 24
        LINE Normal 16 40 16 56
        LINE Normal 16 72 16 88
        LINE Normal 0 80 8 80
        LINE Normal 8 16 8 80
        LINE Normal 48 16 16 16
        LINE Normal 48 0 48 16
        WINDOW 0 56 32 Left 2
        WINDOW 3 56 72 Left 2
        SYMATTR Value #{part[0]}
        SYMATTR Prefix X
        SYMATTR ModelFile #{libname}.lib
        SYMATTR Description #{is_pmos ? "P" : "N"}-Channel MOSFET transistor
        PIN 48 0 NONE 0
        PINATTR PinName D
        PINATTR SpiceOrder 1
        PIN 0 80 NONE 0
        PINATTR PinName G
        PINATTR SpiceOrder 2
        PIN 48 96 NONE 0
        PINATTR PinName S
        PINATTR SpiceOrder 3
        PIN 80 -16 LEFT 8
        PINATTR PinName Tj
        PINATTR SpiceOrder 4
        PIN 80 112 LEFT 8
        PINATTR PinName Tcase
        PINATTR SpiceOrder 5
      EOF

      File.open("#{libname}_symbols/#{part[0]}.asy", "w") do |f|     
        f.write(L3)   
      end
    end

    parts_L0.each do |part|
      L0 = <<~EOF
        Version 4
        SymbolType CELL
        LINE Normal 48 48 48 96
        LINE Normal 16 80 48 80
        #{polarity}
        LINE Normal 16 8 16 24
        LINE Normal 16 40 16 56
        LINE Normal 16 72 16 88
        LINE Normal 0 80 8 80
        LINE Normal 8 16 8 80
        LINE Normal 48 16 16 16
        LINE Normal 48 0 48 16
        WINDOW 0 56 32 Left 2
        WINDOW 3 56 72 Left 2
        SYMATTR Value #{part[0]}
        SYMATTR Prefix X
        SYMATTR ModelFile #{libname}.lib
        SYMATTR Description #{is_pmos ? "P" : "N"}-Channel MOSFET transistor
        PIN 48 0 NONE 0
        PINATTR PinName D
        PINATTR SpiceOrder 1
        PIN 0 80 NONE 0
        PINATTR PinName G
        PINATTR SpiceOrder 2
        PIN 48 96 NONE 0
        PINATTR PinName S
        PINATTR SpiceOrder 3
      EOF

      File.open("#{libname}_symbols/#{part[0]}.asy", "w") do |f|     
        f.write(L0)   
      end
    end

    parts_L1.each do |part|
      L1 = <<~EOF
        Version 4
        SymbolType CELL
        LINE Normal 48 48 48 96
        LINE Normal 16 80 48 80
        #{polarity}
        LINE Normal 16 8 16 24
        LINE Normal 16 40 16 56
        LINE Normal 16 72 16 88
        LINE Normal 0 80 8 80
        LINE Normal 8 16 8 80
        LINE Normal 48 16 16 16
        LINE Normal 48 0 48 16
        WINDOW 0 56 32 Left 2
        WINDOW 3 56 72 Left 2
        SYMATTR Value #{part[0]}
        SYMATTR Prefix X
        SYMATTR ModelFile #{libname}.lib
        SYMATTR Description #{is_pmos ? "P" : "N"}-Channel MOSFET transistor
        PIN 48 0 NONE 0
        PINATTR PinName D
        PINATTR SpiceOrder 1
        PIN 0 80 NONE 0
        PINATTR PinName G
        PINATTR SpiceOrder 2
        PIN 48 96 NONE 0
        PINATTR PinName S
        PINATTR SpiceOrder 3
      EOF

      File.open("#{libname}_symbols/#{part[0]}.asy", "w") do |f|     
        f.write(L1)   
      end
    end
  end
end