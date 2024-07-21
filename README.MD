# CS-BSoD Cure by Mass General Brigham 

This project developed an automated solution to address and remediate issues related to the recent CrowdStrike stop error (also known as Blue Screen of Death) global event on July 19, 2024, impacting Windows devices (servers, desktops, laptops and kiosk style devices).  The initial solutions from CrowdStrike and Microsoft were extremely manual and time-consuming, requiring a technical resource and over 15 minutes per device. This was not scalable. Given 8.5M devices impacted worldwide, the public needs a fully automated solution that does not require technical knowledge and takes under a minute to remediate a device. 

# Summary of the solution:

1.	Microsoft Endpoint Configuration Manager (MECM) with Full Media ISO image file that contains a full set of vendors (Dell & HP) Windows PE (WinPE) drivers.  

2.	Windows WinPE is Microsoft’s lightweight operating system used for system recovery of workstations, and servers, or for troubleshooting an operating system while it is offline.
   
3.	The ISO image was created with a MECM media creation process that included an expiration date.  When creating your own ISO, an expiration date is optional.
   
4.	PowerShell Script template that includes a hash table to contain an offline copy of Microsoft BitLocker Administration and Monitoring (MBAM) IDs & Keys, necessary Microsoft manage-bde commands, and deletion of the c-00000291*.sys file to automate the recovery process.  It’s recommended that the script be compiled into an executable.  Signing and additional security measures may be warranted and should be reviewed with your security team before implementation.

5. USB Boot Media Utility used was Rufus. Rufus is a utility that helps format and create bootable USB flash drives, such as USB keys/pendrives, memory sticks, etc.    

6.	Total Media Size is less than 1 GB
   
7.	Takes less than 1 minute (approx.) to execute and remediate an affected device 

8. Instrcutions attached 

# Disclaimers and Warranties
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Contact
[Adam Landman](https://www.linkedin.com/in/adam-landman-162b2333/) | cio@mgb.org

[Nallan Sriraman](https://www.linkedin.com/in/nallansriraman/) | cto@mgb.org

# Project Link
[CS-BSoD-Cure-by-Mass-General-Brigham](https://github.com/massgeneralbrigham/CS-BSoD-MGB/blob/main/README.MD)

# Acknowledgements
[Shawn Louis Martineau](https://www.linkedin.com/in/shawn-martineau-a087ba21/) – Primary Inventor

[Michael J Ricci](https://www.linkedin.com/in/michael-ricci-ma/) – Primary Inventor 

[Herb Harrison](https://www.linkedin.com/in/herbertaharrison2/) – Major Contributor

[Melissa Landman](https://www.linkedin.com/in/melissa-landman-56970b9/)  – Photo Creator

[Rebecca G. Mishuris](https://www.linkedin.com/in/rebecca-mishuris) – Coined Term/Nomenclator

# Copyright
Copyright (c) 2024 Mass General Brigham Incorporated

