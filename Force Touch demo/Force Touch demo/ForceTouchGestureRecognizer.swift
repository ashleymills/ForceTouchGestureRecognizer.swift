/*
Copyright (c) 2015, Ashley Mills
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit
import UIKit.UIGestureRecognizerSubclass

class ForceTouchGestureRecognizer: UIGestureRecognizer {
    
    private(set) var forceValue: CGFloat? // value between 0.0 - 1.0
    
    var minimumValue: CGFloat = 0 // Value between 0.0 - 1.0 that needs to be reached before gesture begins
    var tolerance: CGFloat = 1 // Once force drops below maxValue - tolerance, the gesture ends
    
    private var maxValue: CGFloat = 0
    
    override func reset() {
        super.reset()
        forceValue = nil
        maxValue = 0
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        if #available(iOS 9.0, *) {
            if touches.count != 1 {
                state = .Failed
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesMoved(touches, withEvent: event)
        if #available(iOS 9.0, *) {
            
            let touch = touches.first!
            let value = touch.force / touch.maximumPossibleForce

            if state == .Possible {
                
                if value > minimumValue {
                    state = .Began
                }
            } else {
                
                if value < (maxValue - tolerance) {
                    state = .Ended
                } else {
                    maxValue = max(self.forceValue ?? 0, maxValue)
                    self.forceValue = value
                    state = .Changed
                }
            }
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesCancelled(touches, withEvent: event)
        if state == .Began || state == .Changed {
            state = .Cancelled
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        if state == .Began || state == .Changed {
            state = .Ended
        }
    }
    
}
