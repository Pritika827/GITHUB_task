Import-Csv c:\TEMP\details.csv | ForEach-Object {
    
 "$($_.emailid) - $($_.org) - $($_.repository) - $($_.username) "
gh repo create CG-FS-ABL/$($_.repository) --private
gh api /repos/$($_.org)/$($_.repository)/collaborators/$($_.username) -X PUT -f permission='push'

 }



