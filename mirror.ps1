#git clone --bare https://github.com/CG-FS-ABL/OrderApp_repo.git
#cd .\OrderApp_repo.git

Import-Csv c:\TEMP\details.csv | ForEach-Object {
    
  "$($_.emailid) - $($_.org) - $($_.repository) - $($_.username) "
 #gh repo create CG-FS-ABL/$($_.repository) --private
 #gh api /repos/$($_.org)/$($_.repository)/collaborators/$($_.username) -X PUT -f permission='push'
 
   git push --mirror https://github.com/$($_.org)/$($_.repository)
  }
 
 
 
 