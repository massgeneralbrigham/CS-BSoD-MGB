# CS-BSD-Cure-by-Mass-General-Brigham 

This project developed an automated solution to address and remediate issues related to the recent CrowdStrike stop error (also known as Blue Screen of Death) global event on July 19, 2024, impacting Windows devices (servers, desktops, laptops and kiosk style devices).  The initial solutions from CrowdStrike and Microsoft were extremely manual and time-consuming, requiring a technical resource and over 15 minutes per device. This was not scalable. Given 8.5M devices impacted worldwide, the public needs a fully automated solution that does not require technical knowledge and takes under a minute to remediate a device. 


# Summary of the solution:

1.	Microsoft Endpoint Configuration Manager (MECM) with Full Media ISO image file that contains a full set of vendors (Dell & HP) Windows PE (WinPE) drivers.  

2.	Windows WinPE is Microsoft’s lightweight operating system used for system recovery of workstations, and servers, or for troubleshooting an operating system while it is offline.
   
3.	The ISO image will expire on August 20th at midnight. After this date, it will not function as intended.
   
4.	PowerShell Script template that includes a hash table to contain an offline copy of Microsoft BitLocker Administration and Monitoring (MBAM) IDs & Keys, necessary Microsoft manage-bde commands, and deletion of the c-00000291*.sys file to automate the recovery process.  It’s recommended that the script be compiled into an executable.  Signing and additional security measures may be warranted and should be reviewed with your security team before implementation.
   
5.	Total Media Size is less than 1Gig.
   
6.	Takes less than 1 minute (approx.) to execute and remediate an affected device 

# Steps needed for Remediation: 

1.	Plug in USB with the ISO Image
2.	Reboot the device by holding the power button
3.	Hold [F9] for HP device or [F12] for Dell device while the device is booting up
4.	Select Boot from USB
5.	Task Sequence Menu Appears: Click Next (twice)
6.	The user will then see: “Crowdstrike fix completed successfully, rebooting in 30 seconds".  
7.	The device will then reboot to a working state
8.	Remove the USB and move on to the next device

# Disclaimers and Warranties
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Contact
[Adam Landman](https://www.linkedin.com/in/adam-landman-162b2333/) | cio@mgb.org

[Nallan Sriraman](https://www.linkedin.com/in/nallansriraman/) | cto@mgb.org

# Project Link
[CS-BSD-Vaccine-by-Mass-General-Brigham](https://github.com/nsriraman/CS-Vaccine-by-Mass-General-Brigham/tree/main)

# Acknowledgements
[Shawn Louis Martineau](https://www.linkedin.com/in/shawn-martineau-a087ba21/) – Primary Inventor

[Michael J Ricci](https://www.linkedin.com/in/michael-ricci-ma/) – Primary Inventor 

[Herb Harrison](https://www.linkedin.com/in/herbertaharrison2/) – Major Contributor

[Melissa Landman](https://www.linkedin.com/in/melissa-landman-56970b9/)  – Photo Creator

[Rebecca G. Mishuris](https://www.linkedin.com/in/rebecca-mishuris) – Coined Term/Nomenclator
