#AD cmdlet 실행을 위한 Active Directory 모듈 가져오기
Import-Module activedirectory  

# 1.원더걸스 OU 생성
New-ADOrganizationalUnit -Name "원더걸스" -Path "DC=sol,DC=COM" -ProtectedFromAccidentalDeletion $False

# 2. 원더걸스 OU 안에 사용자 생성
New-ADUser -Name “소희"  -Surname "소희" -SamAccountName "wonder1" -UserPrincipalName "wonder1@itbank.vm" -path "OU=원더걸스,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "소희계정패스워드입력해") -enabled $True

New-ADUser -Name “선예"  -Surname "선예" -SamAccountName "wonder2" -UserPrincipalName "wonder2@itbank.vm" -path "OU=원더걸스,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "선예패스워드입력해") -enabled $True

# 3. 소녀시대 OU 생성
New-ADOrganizationalUnit -Name "소녀시대" -Path "DC=sol,DC=COM" -ProtectedFromAccidentalDeletion $False

#4. 소녀시대 ou 사용자 생성
New-ADUser -Name “태연"  -Surname "태연" -SamAccountName "wonder3" -UserPrincipalName "girl1@itbank.vm" -path "OU=소녀시대,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "태연계정패스워드입력해") -enabled $True
New-ADUser -Name “윤아"  -Surname "윤아" -SamAccountName "wonder4" -UserPrincipalName "girl2@itbank.vm" -path "OU=소녀시대,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "윤아계정패스워드입력해") -enabled $True

# 5. 수강생 ou 생성대
New-ADOrganizationalUnit -Name "수강생" -Path "DC=sol,DC=COM" -ProtectedFromAccidentalDeletion $False

# 6. 원더걸스OU와 소녀시대OU를 부서-수강생 OU로 이동
Move-ADObject -Identity "OU=원더걸스,DC=sol,DC=com" -TargetPath "OU=수강생,DC=sol,DC=com"
Move-ADObject -Identity "OU=소녀시대,DC=sol,DC=com" -TargetPath "OU=수강생,DC=sol,DC=com"