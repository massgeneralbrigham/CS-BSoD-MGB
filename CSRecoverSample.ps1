<#
.SYNOPSIS
  This script remidates a device impacted by the CrowdStrike update.

.DESCRIPTION
  This script uses are HashTable to match the recovery ID to get the key.

.NOTES
  Version:        1.1
  Author:         Mass General Brigham 
  Creation Date:  7/20/2024
#>

# Recovery Keys HashTable >>> this is where you will find a way to extract your BitLocker keys and create this hash table. The way to extract keys is specific to your organization. So ask your Windows admninstrator for access, and create the hash table with IDs and KEYS

$recoveryKeys = @{
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    }
    
    # Get Recovery ID from Local Machine
    try
    {
        $getbitlockerinfo = Invoke-Expression "manage-bde -protectors -get C: -t RecoveryPassword" -WarningAction Stop
        $recoveryKeyID = ($getbitlockerinfo | Select-String -Pattern 'ID:\s+{(.+?)}').Matches.Groups[1].Value
    }
    catch
    {
        Write-host -f red "Encountered Error:"$_.Exception.Message
    }
    # Search for the Recovery Key based on Recovery ID
    $matchingRecoveryKey = $recoveryKeys.$recoveryKeyID.ToString()
    
    # Check if a matching Recovery Key was found, unlock drive if found, and delete CS files
    if ($matchingRecoveryKey.length -gt 0)
    {
        try
        {
            write-host "Recovery key found for" $recoveryKeyID
            write-host "Recovery key:" $matchingRecoveryKey
            Write-host "Unlocking Bitlocker Encrypted Drive"
            manage-bde -unlock c: -RecoveryPassword $matchingRecoveryKey
            Write-host "Deleting Crowdstrike corrupt files"
            Cd c:\windows\system32\drivers\crowdstrike
            Del c-00000291*.sys
            Write-host "Crowdstrike fix completed succesfully, rebooting in 30 seconds"
        }
        catch
        {
            Write-host -f red "Encountered Error:"$_.Exception.Message
        }
    }
    else
    {
        #Failed to find a matching Key	
        Write-host $recoveryKeyID
        write-host "Recovery key not found!"
    }