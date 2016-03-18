//
//  ViewController.swift
//  Final Project
//
//  Created by JackelynShen on 11/28/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mines: [Coordinate] = []
    var game: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let b=UIButton(frame: CGRect(x: view.bounds.width/8*2, y: view.bounds.height/10, width: view.bounds.width-200, height: view.bounds.height/4-100))
        b.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        b.backgroundColor=UIColor.blueColor()
        b.setTitle("New game", forState: .Normal)
        b.layer.borderColor=UIColor.blackColor().CGColor
        b.layer.borderWidth=1.5
        b.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(b)
        newBoard()
    }
    
        func newBoard() {
        
        for var i=0; i<10; ++i {
            var duplicate: Bool = false
            let random1=Int(arc4random_uniform(UInt32(8)) + 1)
            let random2=Int(arc4random_uniform(UInt32(8)) + 1)
            let c = Coordinate(row: random1, col: random2)
            for var j=0; j<i; ++j {
                let c2=self.mines[j]
                if c2.row==c.row && c2.col==c.col {
                    mines.append(Coordinate(row: 0, col: 0))
                    duplicate=true
                }
            }
            if duplicate==false {
                mines.append(c)
            }
       }
        
        
        for var i=1; i<=8; ++i {
            for var j=1; j<=8; ++j {
                let b=UIButton(frame: CGRect(x: (view.bounds.width/8)*CGFloat(j-1), y: view.bounds.height/4+(view.bounds.width/8)*CGFloat(i-1), width: view.bounds.width/8, height: view.bounds.width/8))
                b.tag=(i*10)+j
                var found: Bool = false
                for var k=0; k<10; ++k {
                    if found==false {
                        let c=mines[k]
                        if c.row==i && c.col==j {
                            b.setTitle("X", forState: .Normal)
                            found=true
                        }
                    }
                }
                if found == false {
                    var count = 0
                    
                    if i+1<=8 {
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i+1 && c2.col==j {
                                count=count+1
                            }
                        }
                    }
                    
                    //i, j+1
                    if j+1<=8 {
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i && c2.col==j+1 {
                                count=count+1
                            }
                        }
                    }
                    
                    //i+1, j+1
                    if i+1<=8 && j+1<=8 {
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i+1 && c2.col==j+1 {
                                count=count+1
                            }
                        }
                    }
                    
                    //i-1, j
                    if i-1>0 {
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i-1 && c2.col==j {
                                count=count+1

                            }
                        }
                    }
                    
                    //i, j-1
                    if j-1>0 {
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i && c2.col==j-1 {
                                count=count+1
                            }
                        }
                    }
                    
                    //i-1, j-1
                    if i-1>0 && j-1>0{
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i-1 && c2.col==j-1 {
                                count=count+1
                            }
                        }
                    }
                    
                    //i+1, j-1
                    if i+1<=8 && j-1>0{
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i+1 && c2.col==j-1 {
                                count=count+1
                            }
                        }
                    }
                    
                    //i-1, j+1
                    if i-1>0 && j+1<=8{
                        for var m=0; m<10; ++m {
                            let c2=self.mines[m]
                            if c2.row==i-1 && c2.col==j+1 {
                                count=count+1
                            }
                        }
                    }
        
                    b.setTitle(String(count), forState: .Normal)

                            
                }
                        
                
                b.setTitleColor(UIColor.blueColor(), forState: .Normal)
                b.backgroundColor=UIColor.blueColor()
                b.layer.borderColor=UIColor.blackColor().CGColor
                b.layer.borderWidth=2.5
                b.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
                self.view.addSubview(b)
            
            }


        }
        

        }

    
    
    
    func pressed(sender: UIButton!) {
        if sender.currentTitle == "New game" {
            mines=[]
            game=true
            newBoard()
        }
        else {
        if(game==true) {
            if sender.currentTitle=="X" {
                sender.backgroundColor=UIColor.redColor()
                game=false
                
            }
            else {
                sender.backgroundColor=UIColor.lightGrayColor()
                
            }
        }
        }
        
    }
    
}


