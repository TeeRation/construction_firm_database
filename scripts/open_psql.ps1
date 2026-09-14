$ErrorActionPreference = 'Stop'

$psql = 'C:\Program Files\PostgreSQL\17\bin\psql.exe'
if (-not (Test-Path $psql)) {
    throw "psql was not found at $psql"
}

$previousEncoding = $env:PGCLIENTENCODING

try {
    chcp 1251 | Out-Null
    $env:PGCLIENTENCODING = 'WIN1251'

    & $psql `
        -h localhost `
        -p 5432 `
        -U construction_user `
        -d construction_firm_database
}
finally {
    if ($null -eq $previousEncoding) {
        Remove-Item Env:PGCLIENTENCODING -ErrorAction SilentlyContinue
    }
    else {
        $env:PGCLIENTENCODING = $previousEncoding
    }
}
