#!/bin/bash

SWAMP='"Swamp" =     {
  "Ansi 0 Color" =         {
      "Blue Component" = "0.0977228";
      "Green Component" = "0.0977449";
      "Red Component" = "0.09772994";
  };
  "Ansi 1 Color" =         {
      "Blue Component" = "0.4236412";
      "Green Component" = "0.5657789";
      "Red Component" = "0.6651584";
  };
  "Ansi 10 Color" =         {
      "Blue Component" = "0.1933654";
      "Green Component" = "0.4607081";
      "Red Component" = "0.4243191";
  };
  "Ansi 11 Color" =         {
      "Blue Component" = "0.1767501";
      "Green Component" = "0.414113";
      "Red Component" = "0.7194178";
  };
  "Ansi 12 Color" =         {
      "Blue Component" = "0.5732731";
      "Green Component" = "0.3750651";
      "Red Component" = "0.3761167";
  };
  "Ansi 13 Color" =         {
      "Blue Component" = "0.6735948";
      "Green Component" = "0.3956702";
      "Red Component" = "0.6322277";
  };
  "Ansi 14 Color" =         {
      "Blue Component" = "0.7354881";
      "Green Component" = "0.6537723";
      "Red Component" = "0.5680824";
  };
  "Ansi 15 Color" =         {
      "Blue Component" = 1;
      "Green Component" = 1;
      "Red Component" = 1;
  };
  "Ansi 2 Color" =         {
      "Blue Component" = "0.08717822";
      "Green Component" = "0.3519665";
      "Red Component" = "0.1618501";
  };
  "Ansi 3 Color" =         {
      "Blue Component" = "0.2127205";
      "Green Component" = "0.5005897";
      "Red Component" = "0.8733032";
  };
  "Ansi 4 Color" =         {
      "Blue Component" = "0.7239819";
      "Green Component" = "0.4767005";
      "Red Component" = "0.4756391";
  };
  "Ansi 5 Color" =         {
      "Blue Component" = "0.5927602";
      "Green Component" = "0.3494978";
      "Red Component" = "0.5569247";
  };
  "Ansi 6 Color" =         {
      "Blue Component" = "0.5113305";
      "Green Component" = "0.4370018";
      "Red Component" = "0.3598599";
  };
  "Ansi 7 Color" =         {
      "Blue Component" = "0.7333333492279053";
      "Green Component" = "0.7333333492279053";
      "Red Component" = "0.7333333492279053";
  };
  "Ansi 8 Color" =         {
      "Blue Component" = "0.5722487";
      "Green Component" = "0.5723782";
      "Red Component" = "0.5722905";
  };
  "Ansi 9 Color" =         {
      "Blue Component" = "0.3664102";
      "Green Component" = "0.4848351";
      "Red Component" = "0.5718893";
  };
  "Anti Alias" = 1;
  "Background Color" =         {
      "Blue Component" = "0.0977228";
      "Green Component" = "0.0977449";
      "Red Component" = "0.09772994";
  };
  Blur = 1;
  "Bold Color" =         {
      "Blue Component" = 0;
      "Green Component" = 0;
      "Red Component" = "0.3891402";
  };
  Columns = 130;
  "Cursor Color" =         {
      "Blue Component" = "0.0058047";
      "Green Component" = "0.00440301";
      "Red Component" = "0.4021737";
  };
  "Cursor Text Color" =         {
      "Blue Component" = 1;
      "Green Component" = 1;
      "Red Component" = 1;
  };
  "Disable Bold" = 0;
  Font = "Monaco 12";
  "Foreground Color" =         {
      "Blue Component" = "0.4630257";
      "Green Component" = "0.4631304";
      "Red Component" = "0.4630596";
  };
  "Horizontal Character Spacing" = 1;
  NAFont = "Monaco 12";
  Rows = 45;
  "Selected Text Color" =         {
      "Blue Component" = "0.5722487";
      "Green Component" = "0.5723782";
      "Red Component" = "0.5722905";
  };
  "Selection Color" =         {
      "Blue Component" = 1;
      "Green Component" = "0.8353000283241272";
      "Red Component" = "0.7098000049591064";
  };
  Transparency = 0;
  "Vertical Character Spacing" = 1;
};'

DISPLAYS=`defaults read net.sourceforge.iTerm Displays | sed "s/}$//"`
DISPLAYS+=$SWAMP
DISPLAYS+="}"
defaults write net.sourceforge.iTerm Displays "$DISPLAYS"
echo "Swamp display profile added"

BOOKMARKS=`defaults read net.sourceforge.iTerm Bookmarks | sed 's/"Display Profile" = "[^"]*";/"Display Profile" = "Swamp";/'`
defaults write net.sourceforge.iTerm Bookmarks "$BOOKMARKS"
echo "Swamp display profile installed as default"