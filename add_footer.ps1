# Script PowerShell per aggiungere il footer a tutte le pagine

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Aggiunta Footer a tutte le pagine" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Footer HTML template
$footerHTML = @"

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-logo">
                <img src="../imgs/logotipo_mic.svg" alt="MIC Logo">
            </div>

            <div class="footer-contact">
                <div class="footer-contact-info">
                    <div class="footer-contact-item">
                        <p>Viale Baccarini n. 19<br>48018 Faenza (RA)</p>
                    </div>
                    <div class="footer-contact-item">
                        <p>Cellulare: <a href="tel:+390546697311">+39 0546 69 73 11</a></p>
                    </div>
                    <div class="footer-contact-item">
                        <p>Email: <a href="mailto:info@micfaenza.org">info@micfaenza.org</a></p>
                    </div>
                </div>
            </div>

            <div class="footer-content">
                <div class="footer-section">
                    <h4>Visita</h4>
                    <ul>
                        <li><a href="../prenota_ora/index.html">Prenota ora</a></li>
                        <li><a href="../didattica_scuole/index.html">Didattica per le scuole</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h4>Cosa vedere</h4>
                    <ul>
                        <li><a href="../le_collezioni/index.html">Le Collezioni</a></li>
                        <li><a href="../calendario_eventi/index.html">Calendario Eventi</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h4>Info</h4>
                    <ul>
                        <li><a href="../chi_siamo/index.html">Chi siamo</a></li>
                        <li><a href="../dove_siamo/index.html">Dove siamo</a></li>
                        <li><a href="../news/index.html">News</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h4>Conservazione</h4>
                    <ul>
                        <li><a href="../depositi/index.html">Depositi</a></li>
                        <li><a href="../restauri/index.html">Restauri</a></li>
                        <li><a href="../progetti/index.html">Progetti</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h4>Risorse</h4>
                    <ul>
                        <li><a href="../archivio_fotografico/index.html">Archivio Fotografico</a></li>
                        <li><a href="../biblioteca/index.html">Biblioteca</a></li>
                        <li><a href="../rivista_faenza/index.html">Rivista Faenza</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h4>Altro sul museo</h4>
                    <ul>
                        <li><a href="#">Accessibilità</a></li>
                        <li><a href="#">Contatti</a></li>
                        <li><a href="#">Sostienici</a></li>
                        <li><a href="https://shop.micfaenza.org/" rel="noopener noreferrer" target="_blank">Bookshop</a></li>
                        <li><a href="#">Premio Faenza</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <script>
"@

# Footer CSS template
$footerCSS = @"

/* Footer Styles */
.footer {
    background-color: #26547c;
    color: #fff;
    padding: 50px 100px 40px;
    font-family: 'Outfit', sans-serif;
}

.footer-container {
    max-width: 1200px;
    margin: 0 auto;
}

.footer-logo {
    margin-bottom: 40px;
}

.footer-logo img {
    height: 60px;
    width: auto;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 40px;
    border-top: 1px solid #fff;
    padding-top: 30px;
}

.footer-section h4 {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 0px;
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.footer-section ul {
    list-style: none;
}

.footer-section ul li {
    margin-bottom: 5px;
}

.footer-section ul li a {
    color: #ccc;
    text-decoration: none;
    font-size: 16px;
    transition: color 0.3s ease;
}

.footer-section ul li a:hover {
    color: #fff;
}

.footer-contact {
    margin-bottom: 50px;
}

.footer-contact-info {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
}

.footer-contact-item p {
    color: #ccc;
    font-size: 18px;
    line-height: 1.6;
    font-weight: 500;
}

.footer-contact-item a {
    color: #ccc;
    text-decoration: none;
    transition: color 0.3s ease;
}

.footer-contact-item a:hover {
    color: #fff;
}

/* Responsive */
@media (max-width: 768px) {
    .footer {
        padding: 40px 30px 30px;
    }

    .footer-content {
        grid-template-columns: repeat(2, 1fr);
        gap: 30px;
    }

    .footer-logo img {
        height: 50px;
    }
}

@media (max-width: 480px) {
    .footer-content {
        grid-template-columns: 1fr;
    }

    .footer-contact-info {
        flex-direction: column;
        gap: 20px;
    }
}
"@

# Lista delle cartelle
$folders = @(
    "biblioteca", "calendario_eventi", "chi_siamo", "depositi",
    "didattica_scuole", "dove_siamo", "form_scuole", "le_collezioni",
    "news", "prenota_ora", "progetti", "restauri", "rivista_faenza"
)

$count = 0

foreach ($folder in $folders) {
    Write-Host "Processando $folder..." -ForegroundColor Yellow
    
    # Processa HTML
    $htmlPath = Join-Path $folder "index.html"
    if (Test-Path $htmlPath) {
        $content = Get-Content $htmlPath -Raw -Encoding UTF8
        
        if ($content -notmatch "<!-- Footer -->") {
            Write-Host "  - Aggiungendo footer HTML a $htmlPath" -ForegroundColor Green
            $content = $content -replace '    <script>', $footerHTML
            Set-Content $htmlPath -Value $content -Encoding UTF8
            $count++
        } else {
            Write-Host "  - Footer HTML gia presente in $htmlPath" -ForegroundColor Gray
        }
    } else {
        Write-Host "  - File $htmlPath non trovato" -ForegroundColor Red
    }
    
    # Processa CSS (controlla sia css che CSS)
    $cssPath = Join-Path $folder "css\styles.css"
    $cssPathUpper = Join-Path $folder "CSS\styles.css"
    
    if (Test-Path $cssPath) {
        $cssContent = Get-Content $cssPath -Raw -Encoding UTF8
        if ($cssContent -notmatch "/\* Footer Styles \*/") {
            Write-Host "  - Aggiungendo footer CSS a $cssPath" -ForegroundColor Green
            Add-Content $cssPath -Value $footerCSS -Encoding UTF8
            $count++
        } else {
            Write-Host "  - Footer CSS gia presente in $cssPath" -ForegroundColor Gray
        }
    } elseif (Test-Path $cssPathUpper) {
        $cssContent = Get-Content $cssPathUpper -Raw -Encoding UTF8
        if ($cssContent -notmatch "/\* Footer Styles \*/") {
            Write-Host "  - Aggiungendo footer CSS a $cssPathUpper" -ForegroundColor Green
            Add-Content $cssPathUpper -Value $footerCSS -Encoding UTF8
            $count++
        } else {
            Write-Host "  - Footer CSS gia presente in $cssPathUpper" -ForegroundColor Gray
        }
    } else {
        Write-Host "  - File styles.css non trovato in $folder" -ForegroundColor Red
    }
    
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Completato! Modifiche apportate: $count" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
