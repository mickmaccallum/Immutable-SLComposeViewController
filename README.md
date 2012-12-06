SLComposeViewController editing prevention

======================================

I'm not going to write out a long description for this one. It's pretty self explanatory, this project demonstrates how to assign your view controller
as the delegate of the UITextView inside the SLComposeViewController. Doing so allows us to check wether the range at which the user attempts to modify 
the text is withing the "editable text" or the "permanent text" and return YES or NO accordingly.

NOTE: If you wish to prevent the user from modifying ANY of the text, modify ```(BOOL)textView:shouldChangeTextInRange:replacementText``` to look like this:


```objective c - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView == sharingTextView) {
        return NO;
    }
    return YES;
}```



Created by Michael MacCallum on 11/25/12.

Accreditation is not required, but is always appreciated.

This Software is provided on an "AS IS" basis.  I
MAKE NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

That being said, you are free to use this code free of charge for absolutely
anything you want. You may use this in personal projects, commercial projects
or for anything else.