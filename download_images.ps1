$imageUrls = @{
    "hero-bg.jpg" = "https://images.unsplash.com/photo-1587370560942-ad2a04eabb6d"
    "generic-medicines.jpg" = "https://images.unsplash.com/photo-1584308666744-24d5c474f2ae"
    "specialty-pharma.jpg" = "https://images.unsplash.com/photo-1631549916768-4119b4123a21"
    "otc-products.jpg" = "https://images.unsplash.com/photo-1584017911766-d451b3d0e843"
    "quality-assurance.jpg" = "https://images.unsplash.com/photo-1579154204601-01588f351e67"
    "research-development.jpg" = "https://images.unsplash.com/photo-1532187863486-abf9dbad1b69"
    "global-reach.jpg" = "https://images.unsplash.com/photo-1526628953301-3e589a6a8b74"
    "about-hero.jpg" = "https://images.unsplash.com/photo-1563213126-a4273aed2016"
}

$outputPath = "assets\images"

foreach ($image in $imageUrls.GetEnumerator()) {
    $outputFile = Join-Path $outputPath $image.Key
    Write-Host "Downloading $($image.Key)..."
    Invoke-WebRequest -Uri $image.Value -OutFile $outputFile
}
