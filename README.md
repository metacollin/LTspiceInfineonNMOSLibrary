LTspice Infineon NMOS Library
===========================
LTspice Infineon NMOS Library is a semi-complete bundle of Infineon's Power N-Channel MOSFETs up to 100V, current as of January 2017.
It is missing odd symbols such as power modules, dual MOSFETs, etc.
It uses Infineon's publically available libraries, but includes native LTSpice symbols, allowing for easy use and installation.

Installation
--------------
1. Download [LTspice Infineon NMOS Library](https://github.com/metacollin/LTspiceInfineonNMOSLibrary/archive/master.zip).
2. Unzip the downloaded file.
  * macOS:
      1. Copy the `LTspiceInfineonNMOSLibrary/sym/InfineonNMOS` folder  
         into `~/Library/Application\ Support/Ltspice/lib/sym`
      2. Copy the **contents** of the `LTspiceInfineonNMOSLibrary/sub` folder  
         into `~/Library/Application\ Support/Ltspice/lib/sub` (Do NOT overwrite anything!)
  * Windows LTspice IV:
      1. Copy `LTspiceInfineonNMOSLibrary\sym\InfineonNMOS`  
         to `C:\Program Files\LTC\LTspiceIV\lib\sym\InfineonNMOS`
      2. Copy the **contents** of `LTspiceInfineonNMOSLibrary\sub`   
         to `C:\Program Files\LTC\LTspiceIV\lib\sub` (Do NOT overwrite anything!)
  * Windows LTspice XVII:
      1. Copy `LTspiceInfineonNMOSLibrary\sym\InfineonNMOS`  
         to `%USERPROFILE%\Documents\LTspiceXVII\lib\sym\InfineonNMOS`
      2. Copy the **contents** of `LTspiceInfineonNMOSLibrary\sub`   
         to `%USERPROFILE%\Documents\LTspiceXVII\lib\sub` (Do NOT overwrite anything!)
3. Restart LTspice IV / XVII. You should now be able to access the Infineon parts under 'InfineonNMOS'.
4. Dance a happy jig.

Notes
-----------------------
- Original symbols of the LTspice Infineon NMOS Library are released under the [MIT License](LICENSE.txt)
- All .lib files are Infineon's and subject to their licensing and usage terms which can be found in the text of each spice library.
- Original models can be found [here](https://www.infineon.com/cms/en/product/power/power-mosfet/channel.html?channel=db3a304319c6f18c011a14e5341b25f1#ispnTab5)
