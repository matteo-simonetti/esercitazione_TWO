@echo off
setlocal enabledelayedexpansion

echo ========================================
echo    Aggiunta Footer a tutte le pagine
echo ========================================
echo.

REM Lista delle cartelle da processare
set folders=biblioteca calendario_eventi chi_siamo depositi didattica_scuole dove_siamo form_scuole le_collezioni news prenota_ora progetti restauri rivista_faenza

REM Contatore
set /a count=0

REM Footer HTML per sottocartelle
set "footer_marker=<!-- Footer -->"

for %%f in (%folders%) do (
    echo Processando %%f...
    
    REM Controlla se il file HTML esiste
    if exist "%%f\index.html" (
        REM Controlla se il footer è già presente
        findstr /C:"<!-- Footer -->" "%%f\index.html" >nul
        if errorlevel 1 (
            echo   - Aggiungendo footer HTML a %%f\index.html
            powershell -Command "(Get-Content '%%f\index.html' -Raw) -replace '    <script>', ('    <!-- Footer -->' + [Environment]::NewLine + '    <footer class=\"footer\">' + [Environment]::NewLine + '        <div class=\"footer-container\">' + [Environment]::NewLine + '            <div class=\"footer-logo\">' + [Environment]::NewLine + '                <img src=\"../imgs/logotipo_mic.svg\" alt=\"MIC Logo\">' + [Environment]::NewLine + '            </div>' + [Environment]::NewLine + '' + [Environment]::NewLine + '            <div class=\"footer-contact\">' + [Environment]::NewLine + '                <div class=\"footer-contact-info\">' + [Environment]::NewLine + '                    <div class=\"footer-contact-item\">' + [Environment]::NewLine + '                        <p>Viale Baccarini n. 19<br>48018 Faenza (RA)</p>' + [Environment]::NewLine + '                    </div>' + [Environment]::NewLine + '                    <div class=\"footer-contact-item\">' + [Environment]::NewLine + '                        <p>Cellulare: <a href=\"tel:+390546697311\">+39 0546 69 73 11</a></p>' + [Environment]::NewLine + '                    </div>' + [Environment]::NewLine + '                    <div class=\"footer-contact-item\">' + [Environment]::NewLine + '                        <p>Email: <a href=\"mailto:info@micfaenza.org\">info@micfaenza.org</a></p>' + [Environment]::NewLine + '                    </div>' + [Environment]::NewLine + '                </div>' + [Environment]::NewLine + '            </div>' + [Environment]::NewLine + '' + [Environment]::NewLine + '            <div class=\"footer-content\">' + [Environment]::NewLine + '                <div class=\"footer-section\">' + [Environment]::NewLine + '                    <h4>Visita</h4>' + [Environment]::NewLine + '                    <ul>' + [Environment]::NewLine + '                        <li><a href=\"../prenota_ora/index.html\">Prenota ora</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../didattica_scuole/index.html\">Didattica per le scuole</a></li>' + [Environment]::NewLine + '                    </ul>' + [Environment]::NewLine + '                </div>' + [Environment]::NewLine + '' + [Environment]::NewLine + '                <div class=\"footer-section\">' + [Environment]::NewLine + '                    <h4>Cosa vedere</h4>' + [Environment]::NewLine + '                    <ul>' + [Environment]::NewLine + '                        <li><a href=\"../le_collezioni/index.html\">Le Collezioni</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../calendario_eventi/index.html\">Calendario Eventi</a></li>' + [Environment]::NewLine + '                    </ul>' + [Environment]::NewLine + '                </div>' + [Environment]::NewLine + '' + [Environment]::NewLine + '                <div class=\"footer-section\">' + [Environment]::NewLine + '                    <h4>Info</h4>' + [Environment]::NewLine + '                    <ul>' + [Environment]::NewLine + '                        <li><a href=\"../chi_siamo/index.html\">Chi siamo</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../dove_siamo/index.html\">Dove siamo</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../news/index.html\">News</a></li>' + [Environment]::NewLine + '                    </ul>' + [Environment]::NewLine + '                </div>' + [Environment]::NewLine + '' + [Environment]::NewLine + '                <div class=\"footer-section\">' + [Environment]::NewLine + '                    <h4>Conservazione</h4>' + [Environment]::NewLine + '                    <ul>' + [Environment]::NewLine + '                        <li><a href=\"../depositi/index.html\">Depositi</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../restauri/index.html\">Restauri</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../progetti/index.html\">Progetti</a></li>' + [Environment]::NewLine + '                    </ul>' + [Environment]::NewLine + '                </div>' + [Environment]::NewLine + '' + [Environment]::NewLine + '                <div class=\"footer-section\">' + [Environment]::NewLine + '                    <h4>Risorse</h4>' + [Environment]::NewLine + '                    <ul>' + [Environment]::NewLine + '                        <li><a href=\"../archivio_fotografico/index.html\">Archivio Fotografico</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../biblioteca/index.html\">Biblioteca</a></li>' + [Environment]::NewLine + '                        <li><a href=\"../rivista_faenza/index.html\">Rivista Faenza</a></li>' + [Environment]::NewLine + '                    </ul>' + [Environment]::NewLine + '                </div>' + [Environment]::NewLine + '' + [Environment]::NewLine + '                <div class=\"footer-section\">' + [Environment]::NewLine + '                    <h4>Altro sul museo</h4>' + [Environment]::NewLine + '                    <ul>' + [Environment]::NewLine + '                        <li><a href=\"#\">Accessibilità</a></li>' + [Environment]::NewLine + '                        <li><a href=\"#\">Contatti</a></li>' + [Environment]::NewLine + '                        <li><a href=\"#\">Sostienici</a></li>' + [Environment]::NewLine + '                        <li><a href=\"https://shop.micfaenza.org/\" rel=\"noopener noreferrer\" target=\"_blank\">Bookshop</a></li>' + [Environment]::NewLine + '                        <li><a href=\"#\">Premio Faenza</a></li>' + [Environment]::NewLine + '                    </ul>' + [Environment]::NewLine + '                </div>' + [Environment]::NewLine + '            </div>' + [Environment]::NewLine + '        </div>' + [Environment]::NewLine + '    </footer>' + [Environment]::NewLine + '' + [Environment]::NewLine + '    <script>') | Set-Content '%%f\index.html' -Encoding UTF8"
            set /a count+=1
        ) else (
            echo   - Footer HTML gia presente in %%f\index.html
        )
    ) else (
        echo   - File %%f\index.html non trovato
    )
    
    REM Aggiungi CSS del footer se non presente
    if exist "%%f\css\styles.css" (
        findstr /C:"/* Footer Styles */" "%%f\css\styles.css" >nul
        if errorlevel 1 (
            echo   - Aggiungendo footer CSS a %%f\css\styles.css
            echo. >> "%%f\css\styles.css"
            echo /* Footer Styles */ >> "%%f\css\styles.css"
            echo .footer { >> "%%f\css\styles.css"
            echo     background-color: #26547c; >> "%%f\css\styles.css"
            echo     color: #fff; >> "%%f\css\styles.css"
            echo     padding: 50px 100px 40px; >> "%%f\css\styles.css"
            echo     font-family: 'Outfit', sans-serif; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-container { >> "%%f\css\styles.css"
            echo     max-width: 1200px; >> "%%f\css\styles.css"
            echo     margin: 0 auto; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-logo { >> "%%f\css\styles.css"
            echo     margin-bottom: 40px; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-logo img { >> "%%f\css\styles.css"
            echo     height: 60px; >> "%%f\css\styles.css"
            echo     width: auto; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-content { >> "%%f\css\styles.css"
            echo     display: grid; >> "%%f\css\styles.css"
            echo     grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); >> "%%f\css\styles.css"
            echo     gap: 40px; >> "%%f\css\styles.css"
            echo     border-top: 1px solid #fff; >> "%%f\css\styles.css"
            echo     padding-top: 30px; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-section h4 { >> "%%f\css\styles.css"
            echo     font-size: 18px; >> "%%f\css\styles.css"
            echo     font-weight: 600; >> "%%f\css\styles.css"
            echo     margin-bottom: 0px; >> "%%f\css\styles.css"
            echo     color: #fff; >> "%%f\css\styles.css"
            echo     text-transform: uppercase; >> "%%f\css\styles.css"
            echo     letter-spacing: 0.5px; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-section ul { >> "%%f\css\styles.css"
            echo     list-style: none; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-section ul li { >> "%%f\css\styles.css"
            echo     margin-bottom: 5px; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-section ul li a { >> "%%f\css\styles.css"
            echo     color: #ccc; >> "%%f\css\styles.css"
            echo     text-decoration: none; >> "%%f\css\styles.css"
            echo     font-size: 16px; >> "%%f\css\styles.css"
            echo     transition: color 0.3s ease; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-section ul li a:hover { >> "%%f\css\styles.css"
            echo     color: #fff; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-contact { >> "%%f\css\styles.css"
            echo     margin-bottom: 50px; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-contact-info { >> "%%f\css\styles.css"
            echo     display: flex; >> "%%f\css\styles.css"
            echo     flex-wrap: wrap; >> "%%f\css\styles.css"
            echo     gap: 30px; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-contact-item p { >> "%%f\css\styles.css"
            echo     color: #ccc; >> "%%f\css\styles.css"
            echo     font-size: 18px; >> "%%f\css\styles.css"
            echo     line-height: 1.6; >> "%%f\css\styles.css"
            echo     font-weight: 500; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-contact-item a { >> "%%f\css\styles.css"
            echo     color: #ccc; >> "%%f\css\styles.css"
            echo     text-decoration: none; >> "%%f\css\styles.css"
            echo     transition: color 0.3s ease; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo .footer-contact-item a:hover { >> "%%f\css\styles.css"
            echo     color: #fff; >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo /* Responsive */ >> "%%f\css\styles.css"
            echo @media (max-width: 768px) { >> "%%f\css\styles.css"
            echo     .footer { >> "%%f\css\styles.css"
            echo         padding: 40px 30px 30px; >> "%%f\css\styles.css"
            echo     } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo     .footer-content { >> "%%f\css\styles.css"
            echo         grid-template-columns: repeat(2, 1fr); >> "%%f\css\styles.css"
            echo         gap: 30px; >> "%%f\css\styles.css"
            echo     } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo     .footer-logo img { >> "%%f\css\styles.css"
            echo         height: 50px; >> "%%f\css\styles.css"
            echo     } >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo @media (max-width: 480px) { >> "%%f\css\styles.css"
            echo     .footer-content { >> "%%f\css\styles.css"
            echo         grid-template-columns: 1fr; >> "%%f\css\styles.css"
            echo     } >> "%%f\css\styles.css"
            echo. >> "%%f\css\styles.css"
            echo     .footer-contact-info { >> "%%f\css\styles.css"
            echo         flex-direction: column; >> "%%f\css\styles.css"
            echo         gap: 20px; >> "%%f\css\styles.css"
            echo     } >> "%%f\css\styles.css"
            echo } >> "%%f\css\styles.css"
            set /a count+=1
        ) else (
            echo   - Footer CSS gia presente in %%f\css\styles.css
        )
    ) else if exist "%%f\CSS\styles.css" (
        findstr /C:"/* Footer Styles */" "%%f\CSS\styles.css" >nul
        if errorlevel 1 (
            echo   - Aggiungendo footer CSS a %%f\CSS\styles.css
            REM Stesso codice per CSS maiuscolo
            echo. >> "%%f\CSS\styles.css"
            type footer_css.txt >> "%%f\CSS\styles.css"
            set /a count+=1
        ) else (
            echo   - Footer CSS gia presente in %%f\CSS\styles.css
        )
    ) else (
        echo   - File styles.css non trovato in %%f
    )
    
    echo.
)

echo ========================================
echo Completato! Pagine aggiornate: %count%
echo ========================================
pause
