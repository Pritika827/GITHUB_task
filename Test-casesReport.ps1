$XMLfile = 'C:\local-repos\Test_Repo\Test-Repos\target\surefire-reports\TEST-com.cg.Test_Repos.AppTest.xml'
 [XML]$testsuite = Get-Content $XMLfile

 foreach($catalogDetails in $testsuite.testsuite){

 Write-Host "Tests :" $catalogDetails.tests
 Write-Host "failures :" $catalogdetails.failures
 Write-Host "name :" $catalogdetails.name
 Write-Host "time :" $catalogdetails.time
 Write-Host "errors :" $catalogdetails.errors
 Write-Host "skipped :" $catalogdetails.skipped
 Write-Host ''
 }
 foreach($catalogDetails in $testsuite.testsuite.testcase){
 Write-Host "classname :" $catalogDetails.classname
 Write-Host "Name :" $catalogDetails.name
 Write-Host "Time :" $catalogDetails.time
 Write-Host ''
 }