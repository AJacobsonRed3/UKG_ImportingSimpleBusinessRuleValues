Set-StrictMode -Version 3

[string]$BusinessRule = "CO_NEWBUSINESSRULE"
[string]$File         = Join-Path $PSScriptRoot "Simple Rule Source.csv"
[string]$OutputFile   = Join-Path $PSScriptRoot "Simple Rule For Upload.xml"
[array]$Records       = @()
[object]$Record       = $null
[string]$RuleCode     = ""
[string]$Description  = ""

out-file $OutputFile

add-content -path $OutputFile "<Transactions>"

$Records = import-csv $File 


foreach($Record in $Records) {
   $RuleCode = $record.RuleCode
   $Description = $record.Description
   add-content -path $outputFile `
"    <Transaction>
         <Header>
             <TransactionType>SIMPLERULE</TransactionType>
             <BusinessRule>$BusinessRule</BusinessRule>
        </Header>
        <SimpleRule>
             <RuleCode>$RuleCode</RuleCode>
             <Description>$Description</Description>
             <CountryCode>USA</CountryCode>
         </SimpleRule>
    </Transaction>"

}
add-content -path $OutputFile "</Transactions>"


