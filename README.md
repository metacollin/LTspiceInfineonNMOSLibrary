LTspice Infineon NMOS Library
===========================
*now with PMOS!*

**UPDATED August 3rd, 2022:**  LTspice Infineon NMOS Library is a semi-complete bundle of Infineon's Power N-Channel MOSFETs up to 950V, current as of August 3rd, 2022.
It is missing odd symbols such as power modules, dual MOSFETs, etc.

It uses Infineon's publically available libraries, but includes native LTSpice symbols, allowing for easy use and installation.

When available, it uses their native LTSpice libraries, but when not,  PSpice libraries are used.  LTSpice has no problem with PSpice libraries.
There are no encrypted symbols included unfortunately, but only a handful of Infineon's models use encryption so this is not too big an issue.

Current model & symbol count:
**6779** N-channel MOSFETs
**427** P-channel MOSFETs

Total Symbols: **7203**

Installation
--------------
1. Download [LTspice Infineon NMOS Library](https://github.com/metacollin/LTspiceInfineonNMOSLibrary/archive/master.zip).
2. Unzip the downloaded file.
  * macOS:
      1. Copy the `LTspiceInfineonNMOSLibrary/sym/InfineonNMOS` folder  
         into `~/Library/Application\ Support/Ltspice/lib/sym`
      2. Copy the `LTspiceInfineonNMOSLibrary/sym/InfineonPMOS` folder  
         into `~/Library/Application\ Support/Ltspice/lib/sym`
      3. Copy the **contents** of the `LTspiceInfineonNMOSLibrary/sub` folder  
         into `~/Library/Application\ Support/Ltspice/lib/sub`
  * Windows LTspice IV:
      1. Copy `LTspiceInfineonNMOSLibrary\sym\InfineonNMOS`  
         to `C:\Program Files\LTC\LTspiceIV\lib\sym\InfineonNMOS`
      2. Copy `LTspiceInfineonNMOSLibrary\sym\InfineonPMOS`  
         to `C:\Program Files\LTC\LTspiceIV\lib\sym\InfineonPMOS`
      3. Copy the **contents** of `LTspiceInfineonNMOSLibrary\sub`   
         to `C:\Program Files\LTC\LTspiceIV\lib\sub`
  * Windows LTspice XVII:
      1. Copy `LTspiceInfineonNMOSLibrary\sym\InfineonNMOS`  
         to `%USERPROFILE%\Documents\LTspiceXVII\lib\sym\InfineonNMOS`
      2. Copy `LTspiceInfineonNMOSLibrary\sym\InfineonPMOS`  
         to `%USERPROFILE%\Documents\LTspiceXVII\lib\sym\InfineonPMOS`
      3. Copy the **contents** of `LTspiceInfineonNMOSLibrary\sub`   
         to `%USERPROFILE%\Documents\LTspiceXVII\lib\sub`
3. Restart LTspice. You should now be able to access the Infineon parts under 'InfineonNMOS' and 'InfineonPMOS'.
4. Dance a happy jig.

Notes
-----------------------
- Original symbols of the LTspice Infineon NMOS Library are released under the [MIT License](LICENSE.txt)
- All .lib files are Infineon's and subject to their licensing and usage terms which can be found in the text of each spice library.
- Original models can be found [here](https://www.infineon.com/cms/en/product/power/power-mosfet/channel.html?channel=db3a304319c6f18c011a14e5341b25f1#ispnTab5)
