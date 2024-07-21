<#
.SYNOPSIS
  This script remediates a device impacted by the CrowdStrike update.

.DESCRIPTION
  During boot, this script obtains the ID from impacted device using
  manage-bde, scrapes the ID, and matches it against your included
  Hash Table for the key.  The key is used to unlock the device and
  delete the crowdstrike c-00000291*.sys file.

  It is recommended that the script be compiled into a executable so
  the Hash Table isn't exposed to anyone that can read the iso contents.
  Other security controls may be warranted and should be reviewed by 
  your security team.

  IDs and Key can be extracted from your MBAM database using the following
  method:
  Open the SQL Management Studio, and Expand the MBAM_Recovery_and_Hardware database.
  Under Tables, Select RecoveryAndHardwareCore.Keys, and use the following SQLquery:
  Select [RecoveryKeyID], [RecoveryKey] FROM [MBAM_Recovery_and_Hardware].[RecoveryAndHardwareCore].[Keys]
  
  Export the results to csv or txt and format it into a Hash Table format "PUTIDHERE" = "PUTKEYHERE".

.NOTES
  Version:        1.2
  Author:         MGB
  Creation Date:  7/21/2024
#>

# Recovery Keys HashTable
$recoveryKeys = @{
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    "PUTIDHERE" = "PUTKEYHERE"
    }
    
    #Set Variables
    $recoveryKeyID = ""
    $matchingRecoveryKey =""
    
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
    if ($recoveryKeys.ContainsKey($recoveryKeyID)) {
        $matchingRecoveryKey = $recoveryKeys.$recoveryKeyID.ToString()
    }
    
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