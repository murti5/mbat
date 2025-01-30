                @echo off 
                cd C:\Users\Murti\Documents\.Kale\.yazilim\mbat
                 if not exist durum.bat         echo.set proje=%proje%>durum.bat

        :0
                if exist  durum.bat call durum.bat 
                if not "%proje%"=="" if exist  data_%proje%.bat call data_%proje%.bat
                if not "%proje%"=="" if not exist data_%proje%.bat (
                        call projeler\%proje%\data_%proje%.bat  
                        copy projeler\%proje%\data_%proje%.bat    data_%proje%.bat
                        )

        :menu
                cmdwiz setwindowpos  0 525
                set komut=
                color b
                cls
                
batbox /c 0x06 /d "  arayuz 14.1.x (mbat 1.x) "&&echo/
batbox /c 0x0c /d "---------------------------------"&&echo/ 
batbox /c 0x0e /d "  proje :%proje%  tut :%tut% last :%last% ver:%ver% "&&echo/
batbox /c 0x0c /d "------------------------------------------------------------------------------------"&&echo/ 
batbox /c 0x0b /d "  run    0      sp      last    1     tut    11     folder 2    standart st "&&echo/
batbox /c 0x03 /d "  reset  00     mbat    mbatv   vv    mbatf  ver    verr        projeler proje    "&&echo/
batbox /c 0x09 /d "  cmd    help   re      notepad n     paint  pa     hedef  3    multi"&&echo/
batbox /c 0x0c /d "------------------------------------------------------------------------------------"&&echo/
type hedef.txt  
echo/
                set /p komut=^>^> 
                set qq=%komut%  
                if "%komut%"=="run"        start %cd%\%last%                                &&  goto :menu
                if "%komut%"=="0"          start %cd%\%last%                                &&  goto :menu
                if "%komut%"=="sp"         java spaceadder.java %tut% %last%                &&  goto :menu
                if "%komut%"=="last"       start notepad.exe %last%                         &&  goto :menu
                if "%komut%"=="1"          start notepad.exe %last%                         &&  goto :menu 
                if "%komut%"=="tut"        start notepad.exe %tut%                          &&  goto :menu
                if "%komut%"=="11"         start notepad.exe %tut%                          &&  goto :menu
                if "%komut%"=="folder"     start explorer.exe projeler\%proje%              &&  goto :menu
                if "%komut%"=="2"          start explorer.exe projeler\%proje%              &&  goto :menu
                if "%komut%"=="standart"   call :standart                                   &&  goto :menu
                if "%komut%"=="st"         call :standart                                   &&  goto :menu

                if "%komut%"=="reset"      call :reset                                      &&  goto :menu
                if "%komut%"=="00"         call :reset                                      &&  goto :menu 
                if "%komut%"=="mbat"       start notepad.exe mbat.bat                       &&  goto :menu
                if "%komut%"=="mbatv"      call :vermain                                    &&  goto :menu
                if "%komut%"=="vv"         call :vermain                                    &&  goto :menu
                if "%komut%"=="mbatf"      start explorer.exe %cd%                          &&  goto :menu
                if "%komut%"=="ver"        call :ver                                        &&  goto :menu
                if "%komut%"=="verr"       call :verr                                       &&  goto :menu
                if "%komut%"=="proje"      call :proje                                      &&  goto :menu
                if "%komut%"=="projeler"   echo====&&dir /b projeler&&timeout /t 2 >nul     &&  goto :menu
 
                if "%komut%"=="cmd"        start cmd                                        &&  goto :menu  
                if "%komut%"=="help"       call :help                                       &&  goto :menu 
                if "%komut%"=="re"         start mbat.bat  &&exit                           &&  goto :menu 
                if "%komut%"=="notepad"    start notepad.exe                                &&  goto :menu
                if "%komut%"=="n"          start notepad.exe                                &&  goto :menu
                if "%komut%"=="paint"      start mspaint.exe                                &&  goto :menu
                if "%komut%"=="pa"         start mspaint.exe                                &&  goto :menu
                if "%komut%"=="hedef"      start notepad.exe hedef.txt                      &&  goto :menu
                if "%komut%"=="3"          start notepad.exe hedef.txt                      &&  goto :menu
                if "%komut%"=="multi"      start explorer.exe data                          &&  goto :menu 


                if "%komut%"=="q q"        set t=@echo off                                  &&  call :take &&  goto :menu
                if "%komut%"=="q qq"       set t=@echo on                                   &&  call :take &&  goto :menu 

                set r6=%komut:~0,6%
                if  "%r6%"=="import"       call :importfileblock  %komut:~6%                &&  goto :menu
                if  "%r6%"=="langtr"       set t=chcp 65001                                 &&  call :take &&  goto :menu  

                set r5=%komut:~0,5%
                if  "%r5%"=="light"        call :take2 light.txt &&   goto :menu
                if  "%r5%"=="sound"        call :take2 sound.txt &&   goto :menu

                set r4=%komut:~0,4%
                if  "%r4%"=="setp"         set t=set /p %komut:~4%=                         &&  call :take &&   goto :menu
                if  "%r4%"=="seta"         set t=set /a %komut:~4%                          &&  call :take &&   goto :menu  
                if  "%r4%"=="ifne"         set t=if not exist %komut:~4%                    &&  call :take &&   goto :menu  
                if  "%r4%"=="ifnd"         set t=if not defined %komut:~4%                  &&  call :take &&   goto :menu  
                if  "%r4%"=="ifnt"         set t=if not true == %%%komut:~4%%%              &&  call :take &&   goto :menu  
                if  "%r4%"=="ifnf"         set t=if not false == %%%komut:~4%%%             &&  call :take &&   goto :menu  
                if  "%r4%"=="tiii"         set t=timeout /t %komut:~4%                      &&  call :take &&   goto :menu  

                set "r3=%komut:~0,3%"  
                if  "%r3%"=="tii"          set "t=timeout /t %komut:~3%  ^>nul"             &&  call :take &&   goto :menu  
                if  "%r3%"=="sed"          set t=SetLocal EnableDelayedExpansion            &&  call :take &&   goto :menu  
                if  "%r3%"=="sdd"          set t=SetLocal DisableDelayedExpansion           &&  call :take &&   goto :menu  
                if  "%r3%"=="see"          set t=SetLocal EnableExtensions                  &&  call :take &&   goto :menu  
                if  "%r3%"=="sde"          set t=SetLocal DisableExtensions                 &&  call :take &&   goto :menu    
                if  "%r3%"=="ife"          set t=if exist %komut:~3%                        &&  call :take &&   goto :menu  
                if  "%r3%"=="ifd"          set t=if defined  %komut:~3%                     &&  call :take &&   goto :menu  
                if  "%r3%"=="ift"          set t=if true == %%%komut:~3%%%                  &&  call :take &&   goto :menu  
                if  "%r3%"=="iff"          set t=if false == %%%komut:~3%%%                 &&  call :take &&   goto :menu  
                if  "%r3%"=="eof"          set t=goto :eof                                  &&  call :take &&   goto :menu  
                if  "%r3%"=="end"          set t=goto :end                                  &&  call :take &&   goto :menu 
                if  "%r3%"=="ppp"          set "t=pause ^>nul"                              &&  call :take &&   goto :menu  
                if  "%r3%"==":.."          call :take2 fx.txt &&   goto :menu  
 
                set "r2=%komut:~0,2%"
                if "%r2%"=="xy"           set t=cmdwiz setwindowpos %komut:~2%              &&  call :take &&   goto :menu   
                if "%r2%"=="ti"           set t=title %komut:~2%                            &&  call :take &&   goto :menu  
                if "%r2%"=="cc"           set t=color %komut:~2%                            &&  call :take &&   goto :menu  
                if "%r2%"=="pp"           set t=pause                                       &&  call :take &&   goto :menu  
                if "%r2%"==":."           set t=goto :%komut:~2%                            &&  call :take &&   goto :menu  
                if "%r2%"=="mm"           set t=mode %komut:~2%                             &&  call :take &&   goto :menu  
                if "%r2%"=="ee"           call :batbox %komut:~2%                           &&  call :take &&   goto :menu  
                if "%r2%"=="//"           set "t=:: %komut:~2%"                             &&  call :take &&   goto :menu 

                if "%r2%"=="ni"           set t=nircmd                                      &&  goto :menu 
                if "%r2%"=="ns"           set t=nircmd sendkeypress                         &&  goto :menu  
                if "%r2%"=="nc"           set t=nircmd clipboard set                        &&  goto :menu 
                if "%r2%"=="nv"           set t=nircmd sendkeypress ctrl+v                  &&  goto :menu 
                if "%r2%"=="ne"           set t=nircmd sendkeypress enter                   &&  goto :menu 
                ::if "%r2%"=="nh"           set t=nircmd                                      &&  goto :menu 

                if "%r2%"=="mm"           set t=mouse                                       &&  goto :menu 
                if "%r2%"=="mc"           set t=mouse click                                 &&  goto :menu 
                ::if "%r2%"=="mh"           set t=mouse                                       &&  goto :menu           

		start cmd /k %komut%      && nircmd sendkeypress e+x+t+enter                &&  goto :menu   
  

goto :menu 

batbox /c 0x01 /d "1"
batbox /c 0x02 /d "2"
batbox /c 0x03 /d "3"
batbox /c 0x04 /d "4"
batbox /c 0x05 /d "5"
batbox /c 0x06 /d "6"
batbox /c 0x07 /d "7"
batbox /c 0x08 /d "8"
batbox /c 0x09 /d "9"
batbox /c 0x0a /d "a"
batbox /c 0x0b /d "b"
batbox /c 0x0c /d "c"
batbox /c 0x0d /d "d"
batbox /c 0x0e /d "e"
batbox /c 0x0f /d "f"






	:batbox
	
		if "%1"=="100"  set t=batbox /g %2 %3                                       &&  call :take &&   goto :menu
		if "%1"=="010"  set t=batbox /c 0x%2                                        &&  call :take &&   goto :menu
		if "%1"=="001"  set t=batbox /d "%2"                                        &&  call :take &&   goto :menu
		if "%1"=="110"  set t=batbox /g %2 %3 /c 0x%4                               &&  call :take &&   goto :menu
		if "%1"=="101"  set t=batbox /g %2 %3 /d "%4"                               &&  call :take &&   goto :menu
		if "%1"=="011"  set t=batbox /c 0x%2 /d "%3"                                &&  call :take &&   goto :menu
		if "%1"=="111"  set t=batbox /g %2 %3  /c 0x%4 /d  "%5"                     &&  call :take &&   goto :menu
                goto :eof 

 
         

        :standart
                echo.
                dir /b data\*.txt
                set stndrt=
                set /p stndrt=^>^>
                if "%stndrt%"=="0"  goto :eof
                if "%stndrt%"==""   goto :eof
                call :take2 %stndrt%.txt &&goto :menu 
                goto :eof


        :reset 
                echo.set proje=>durum.bat
                set proje=
                set tut=
                set ver=
                goto :eof

        :ver 
                call :versave 1
                goto :eof
        :verr 
                call :versave 100
                goto :eof

        :versave
                set /a ver=%ver%+%1
                if not exist   projeler\%proje%\version   md   projeler\%proje%\version 
                md   projeler\%proje%\version\%ver%
                copy projeler\%proje%\data_%proje%.mbat    projeler\%proje%\version\%ver%
                copy projeler\%proje%\%proje%.mbat         projeler\%proje%\version\%ver%
 
                echo.set proje=%proje%>data_%proje%.bat
                echo.set tut=projeler\%proje%\%proje%.mbat>>data_%proje%.bat
                echo.set last=projeler\%proje%\%proje%.bat>>data_%proje%.bat
                echo.set ver= %ver% >>data_%proje%.bat

                echo.set proje=%proje%>projeler\%proje%\data_%proje%.bat
                echo.set tut=projeler\%proje%\%proje%.mbat >>projeler\%proje%\data_%proje%.bat
                echo.set last=projeler\%proje%\%proje%.bat>>projeler\%proje%\data_%proje%.bat
                echo.set ver= %ver% >>projeler\%proje%\data_%proje%.bat
                goto :eof

        :vermain
                set /p main=<main.txt
                set /a main=%main%+1
 
                md projeler\main\version\%main%
                copy mbat.bat         projeler\main\version\%main%
 
                echo.%main%>main.txt 
                goto :eof

        :proje
                echo mevcut proje=%proje%
                echo anamenu    0 
                echo yeni proje 1
                set /p projevar=^>^>
                if %projevar%==0 goto :proje
                if %projevar%==1 goto :proje1
                goto :proje

        :proje1
                set /p proje=
                echo %proje%
 
                echo.set proje=%proje%>durum.bat

                if exist projeler\%proje% echo zaten var &&call projeler\%proje%\data_%proje%.bat && echo o burda &&pause&& goto :0
        
                if not exist  projeler\%proje%           md projeler\%proje% 
                if not exist  projeler\%proje%\version   md projeler\%proje%\version
                echo.        ::Created by Mmbat>projeler\%proje%\%proje%.mbat
 
                echo.set proje=%proje%>data_%proje%.bat
                echo.set tut=projeler\%proje%\%proje%.mbat >>data_%proje%.bat
                echo.set last=projeler\%proje%\%proje%.bat >>data_%proje%.bat
                echo.set ver= 1 >>data_%proje%.bat
 
                echo.set proje=%proje%>projeler\%proje%\data_%proje%.bat
                echo.set tut=projeler\%proje%\%proje%.mbat >>projeler\%proje%\data_%proje%.bat
                echo.set last=projeler\%proje%\%proje%.bat >>data_%proje%.bat
                echo.set ver= 1 >>projeler\%proje%\data_%proje%.bat

                goto :0

        :help
                echo.file1 file2 libs help
                echo.import langtr eee eeee
                echo.setp seta ifne ifnd ifnt ifnf tiii
                echo.tii  sed sdd see sde ife ifd ift iff eof end
                echo.xy  ti cc pp mm ee :.
                echo.c p
                pause
                goto :eof

                ::// çalışmıyor
                ::if  "%sentence:~0,4%"=="endd"    if "%sentence:~4%"==""         set "endrule=true"&&  call :take &&   goto :menu  
                ::if  "%r3%"=="end"    
                ::if  "%r3%"=="mdd"        set t=md  %komut:~3%                          && echo.cd /d %BB% &&  call :take &&   goto :menu

        :gui block
                if "!sentence:~0,9!"=="buttongui"  echo.//>>%file1% && echo.getinput /m!buttoncoords! /h !buttonhovers! >>%file1% && goto :eof
                if "!sentence:~0,6!"=="button"  call :buttonblock !sentence:~6! && goto :eof
                if "!sentence:~0,5!"=="buton"   call :butonblock !sentence:~5! && goto :eof
                set "B=!sentence:~0,5!"
                set "B=!B: =!"
                if "!B!"=="event" echo.//>>%file1% && echo.if %%%%errorlevel%%%% == !sentence:~5! ( >>%file1%   && set "in_event=true" && goto :eof
                set "B=!sentence:~0,4!"  
                if "!B!"=="ende"  set "in_event=false" && echo.}>>%file1% && goto :eof
                   
        :buttonblock
                set /a numberbuton=!numberbuton!+1
                set "count=0"
                set "lastarg="
                echo.>>%file1%
                for %%a in (%*) do  set /A count+=1 &&  if !count! gtr 8 set "lastarg=!lastarg! %%a"
                call :spacebuttonn  !lastarg!
                echo.batbox /g %1 %2 /c 0x%7 /d "!arg!" >>%file1%

                set buttoncoords=!buttoncoords!   %3 %4 %5 %6
                set buttonhovers=!buttonhovers!   %8   
                goto :eof

        :spacebuttonn
                set "arg=%*"
                goto :eof

        :butonblock
                set /a numberbuton=!numberbuton!+1
                set "text=%3 %4 %5 %6 %7 %8 %9"
                set "count=0"
                set "lastarg="
                echo.>>%file1%
                for %%a in (%*) do  set /A count+=1 &&  if !count! gtr 8 set "lastarg=!lastarg! %%a"
                call :spacebuttonn  !lastarg!
                set nt=0
                set vart=%1
                call :length !text!
                echo.batbox /g 0 !numberbuton! /c 0x%1 /d "!text!" >>%file1%
                set buttoncoords=!buttoncoords!   0 %numberbuton% %nlength% %numberbuton%
                set buttonhovers=!buttonhovers!   %2                                 
                goto :eof
 
        :length
                set vart=%vart:~1%
                set /a nlength=%nlength%+1
                if "%vart%"=="" goto :eof
                goto length
 
        :take 
                echo %t%
                echo.
                echo.0-no
                echo.1-yes
                echo.2-yes+add
                set deger=
                set /p deger=^>^>
                if "%deger%"=="0" goto :eof 
                if "%deger%"=="1" echo %t% | clip &&goto :eof 
                if "%deger%"=="2" ( 
                        echo %t% | clip
                        nircmd sendkeypress alt+tab
                        timeout /t 2
                        nircmd sendkeypress ctrl+v 
                        )
                goto :eof 

        :take2 
        cd data
        type %1 
                echo.
                echo.0-no
                echo.1-yes
                echo.2-yes+add
                set deger=
                set /p deger=^>^>
                if %deger%==0 cd..&&goto :eof 
                if %deger%==1 (
                        clip < %1
                        cd..
                        )
                if %deger%==2 ( 
                        clip < %1
                        nircmd sendkeypress alt+tab
                        timeout /t 2
                        nircmd sendkeypress ctrl+v 
                        cd..
                        )
                goto :eof 

 
 
   

        :importfileblock 
                set "arg=%*"
                for %%A in (%arg%) do  if not exist projeler\%proje%\%%A    copy data\%%A  projeler\%proje%\
                timeout /t 2
                goto :eof
