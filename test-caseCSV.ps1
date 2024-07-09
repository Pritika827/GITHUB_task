$data = New-Object xml;

$data.load('C:\local-repos\Test_Repo\Test-Repos\target\surefire-reports\TEST-com.cg.Test_Repos.AppTest.xml')

$record = [pscustomobject]@{
#"updatetime"             = $data.SelectSingleNode("//testsuite")."#text"
"Tests"          = $data.SelectSingleNode("//testsuite").tests
"Failures"          = $data.SelectSingleNode("//testsuite").failures
"Errors"          = $data.SelectSingleNode("//testsuite").errors
}
$record | ConvertTo-Csv -NoTypeInformation -Delimiter ',' | Set-Content -Path "c:\TEMP\test.csv" -Encoding utf8
