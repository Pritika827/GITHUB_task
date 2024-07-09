$data = New-Object xml;


Import-Csv c:\TEMP\Book1.csv | ForEach-Object {

    "$($_.emailid) - $($_.org) - $($_.repository) - $($_.username) "

    $data.load("C:\local-repos\Test_Repo\$($_.repository)\target\surefire-reports\TEST-com.cg.Test_Repos.AppTest.xml")
        
    $record = [pscustomobject]@{
    #"updatetime"             = $data.SelectSingleNode("//testsuite")."#text"
    "emailid"       =$($_.emailid)
    "repository"    =$($_.repository)
    "username"      =$($_.username)
    "org"           =$($_.org) 
    "Tests"         = $data.SelectSingleNode("//testsuite").tests
    "Failures"      = $data.SelectSingleNode("//testsuite").failures
    "Errors"        = $data.SelectSingleNode("//testsuite").errors 
    }
    $record | ConvertTo-Csv -NoTypeInformation -Delimiter ',' | Set-Content -Path "c:\TEMP\test1.csv" -Encoding utf8

    
    }

