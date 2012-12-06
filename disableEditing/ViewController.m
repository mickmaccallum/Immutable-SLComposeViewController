//
//  ViewController.m
//  disableEditing
//
//  Created by Michael MacCallum on 12/5/12.
//  Accreditation is not required, but is always appreciated.
//
//  This Software is provided on an "AS IS" basis.  I
//  MAKE NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
//  THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
//  OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//
//  IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
//  OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
//  MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
//  AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
//  STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
//  That being said, you are free to use this code free of charge for absolutely
//  anything you want. You may use this in personal projects, commercial projects
//  or for anything else.
#import "ViewController.h"
#import <Social/Social.h>
@interface ViewController () <UITextViewDelegate>
{
    UITextView *sharingTextView;
}
@end
@implementation ViewController



- (NSString *)permanentText
{
    return @"http://www.stackoverflow.com/"; //The user will not be able to modify this text.
}

- (NSString *)editableText
{
    return @"Hello, this is some awesome text I'm sharing with a permanent link!"; //This is the text the user will be able to edit
}


- (IBAction)exampleUsingFacebook:(UIButton *)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *sharingComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            [sharingComposer dismissViewControllerAnimated:YES completion:nil];
        };
        [sharingComposer setCompletionHandler:completionHandler];
        [sharingComposer setInitialText:[NSString stringWithFormat:@"%@ %@",[self editableText],[self permanentText]]];
        
        [self presentViewController:sharingComposer animated:YES completion:^{
            for (UIView *viewLayer1 in [[sharingComposer view] subviews]) {
                for (UIView *viewLayer2 in [viewLayer1 subviews]) {
                    if ([viewLayer2 isKindOfClass:[UIView class]]) {
                        for (UIView *viewLayer3 in [viewLayer2 subviews]) {
                            if ([viewLayer3 isKindOfClass:[UITextView class]]) {
                                [(UITextView *)viewLayer3 setDelegate:self];
                                sharingTextView = (UITextView *)viewLayer3;
                            }
                        }
                    }
                }
            }
        }];
    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView == sharingTextView) {
        NSRange substringRange = [[textView text] rangeOfString:[self permanentText]];
        if (range.location >= substringRange.location && range.location <= substringRange.location + substringRange.length) {
            return NO;
        }
    }
    return YES;
}






















@end