#AD cmdlet 실행을 위한 Active Directory 모듈 가져오기
Import-Module activedirectory

#1. 핑클 OU를 생성하시오
New-ADOrganizationalUnit -Name "핑클" -Path "DC=sol,DC=COM" -ProtectedFromAccidentalDeletion $False

#2번 3번까지  핑클 OU안에 4명의 유저를 생성하시오. SAM ID와 UPN만 가지고 생성하고 암호 입력 후 계정 활성화까지
New-ADUser -Name “이효리"  -SamAccountName "finkle1" -UserPrincipalName "f1@itbank.vm" -path "OU=핑클,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "이효리계정패스워드입력해") -enabled $True
New-ADUser -Name “옥주현"  -SamAccountName "finkle2" -UserPrincipalName "f2@itbank.vm" -path "OU=핑클,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "옥주현계정패스워드입력해") -enabled $True
New-ADUser -Name “성유리"  -SamAccountName "finkle3" -UserPrincipalName "f3@itbank.vm" -path "OU=핑클,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "성유리계정패스워드입력해") -enabled $True
New-ADUser -Name “이진"  -SamAccountName "finkle4" -UserPrincipalName "f4@itbank.vm" -path "OU=핑클,DC=sol,DC=com" -Accountpassword (Read-Host -AsSecureString "이진계정패스워드입력해") -enabled $True

#연예인 OU를 만들고, 소녀시대 OU와 핑클 OU를 이동하시오.
New-ADOrganizationalUnit -Name "연예인" -Path "DC=sol,DC=COM" -ProtectedFromAccidentalDeletion $False
Move-ADObject -Identity "OU=소녀시대,OU=수강생,DC=sol,DC=com" -TargetPath "OU=연예인,DC=sol,DC=com"
Move-ADObject -Identity "OU=핑클,DC=sol,DC=com" -TargetPath "OU=연예인,DC=sol,DC=com"
