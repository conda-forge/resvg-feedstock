:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

:: build
cargo install --locked --root "%LIBRARY_PREFIX%" --path "crates\resvg" || goto :error

:: :: I had to disable this because it was causing a hang.
:: :: <https://matrix.to/#/!SOyumkgPRWoXfQYIFH:matrix.org/$17188919988GjPNB:gitter.im?via=matrix.org&via=gitter.im&via=ifisc.uib-csic.es>
:: :: strip debug symbols
:: strip "%LIBRARY_PREFIX%\bin\resvg.exe" || goto :error

:: remove extra build file
del /F /Q "%LIBRARY_PREFIX%\.crates.toml"

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
