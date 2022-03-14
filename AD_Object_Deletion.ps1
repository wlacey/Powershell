# Deleting Common AD Objects

Import-Module ActiveDirectory

 # Will provide the admin a list of roles to choose from.
 Write-Host "1 - User"
 Write-Host "2 - Computer"
 Write-Host "3 - Group"

# Admin wil indicate what type of object will be deleted.
$Obj = Read-Host "Enter the corresponding number to what type of object you want to delete: "
Switch($Obj) {
    1 {$ValidObj = 'User'}
    2 {$ValidObj = 'Computer'}
    3 {$ValidObj = 'Group'}
    }

# Validate the admin's input.
if ($Obj -lt 1 -or $Obj -gt 3) {
    Write-Host "ERROR - Must input a number corresponding to the object."
}

# Admin chooses a user that will be deleted.
if ($Obj -eq 1) {
    $User = Read-Host "Please enter the username: "
    Try {
        Remove-ADUser $User -Confirm:$true
        Write-Host "The user, $User, has been deleted."
    }
    Catch {
        Write-Host "The user, $User, is not present in the Active Directory."
    }
}

# Admin chooses a computer that will be deleted.
if ($Obj -eq 2) {
    $Comp = Read-Host "Please enter the computer's name: "
    Try {
        Remove-ADComputer $Comp -Confirm:$true
        Write-Host "The computer, $Comp, has been deleted."
    }
    Catch {
        Write-Host "The computer, $Comp, is not present in the Active Directory."
    }
}

# Admin chooses a group that will be deleted.
if ($Obj -eq 3) {
    $Group = Read-Host "Please enter the group's name: "
    Try {
        Remove-ADGroup $Group -Confirm:$true
        Write-Host "The group, $Group, has been deleted."
    }
    Catch {
        Write-Host "The group, $Group, is not present in the Active Directory."
    }
}

