//
//  SecondViewController.swift
//  iQuest
//
//  Created by Philip GeLinas on 7/13/19.
//  Copyright © 2019 Philip GeLinas Inc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    
    // Header variables
    @IBOutlet weak var header: UILabel!
    var counter = 0
    var currentTag = 50
    let max = 50
    
    // Array of labels
    @IBOutlet var labels: [UILabel]!
    
    // Array of photos
    @IBOutlet var photos: [UIImageView]!
    
    // Array of views
    @IBOutlet var views: [UIView]!
    
    // Footer with icons
    @IBOutlet weak var footer: UIView!
    
    // Footer icons
    @IBOutlet weak var button: UIImageView!
    @IBOutlet weak var visited: UILabel!
    @IBOutlet weak var airbnb: UIImageView!
    @IBOutlet weak var expedia: UIImageView!
    @IBOutlet weak var google: UIImageView!
    @IBOutlet weak var wikipedia: UIImageView!
    @IBOutlet weak var minus: UIImageView!
    @IBOutlet weak var plus: UIImageView!
    
    // Description of the current view
    @IBOutlet weak var summary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
        let defaults = UserDefaults.standard
        let keys = defaults.object(forKey: "keys") as? [Int] ?? [Int](arrayLiteral:
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        )
        defaults.set(keys, forKey: "keys")
        for i in 0...49 {
            if keys[i] == 1 {
                views[i].bringSubviewToFront(labels[i])
                photos[i].alpha += 0.5
                counter += 1
                header.text = "States Visited: \(counter) / 50"
            }
        }
    }
    
    // The scroll view
    @IBOutlet weak var scrollView: UIScrollView!

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Movement Detected")
        currentTag = max
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if (UIDevice.current.orientation.isLandscape) {
            print("Landscape")
            currentTag = max
        } else {
            print("Portrait")
            currentTag = max
        }
    }
    
    @IBAction func tap(_ sender: UIGestureRecognizer) {
        
        // Get tag from the sender
        let tag = sender.view!.tag
        
        // If the footer is located at the bottom
        ifMax: if (currentTag == max) {
            // If the bottom view is tapped, break
            if (tag == max) {
                break ifMax
            }
            // Fade out footer
            UIView.animate(withDuration: 0.1) {
                self.footer.alpha = 0.0
            }
            // Move lower views down
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.summary.text = links.descriptions[tag-1]
                for i in tag...self.max {
                    if (i < self.max) {
                        UIView.animate(withDuration: 0.2) {
                            self.views[i].center.y += 192
                        }
                    }
                }
            }
            // Move footer below current view
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.footer.center.y = self.views[tag-1].center.y + 120
                UIView.animate(withDuration: 0.1) {
                    self.footer.alpha = 1.0
                }
                self.currentTag = tag
            }
        // If view is tapped a second time
        } else if (tag == currentTag) {
            // Fade out footer
            UIView.animate(withDuration: 0.1) {
                self.footer.alpha = 0.0
            }
            // Move lower views up
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.summary.text = links.descriptions[self.max-1]
                for i in tag...self.max {
                    if (i < self.max) {
                        UIView.animate(withDuration: 0.2) {
                            self.views[i].center.y -= 192
                        }
                    }
                }
                // Move footer below current view
                self.footer.center.y = 2596
                UIView.animate(withDuration: 0.1) {
                    self.footer.alpha = 1.0
                }
                self.currentTag = self.max
            }
        // If the footer is not at the bottom
        // and a different view is tapped
        } else {
            // Fade out footer
            UIView.animate(withDuration: 0.1) {
                self.footer.alpha = 0.0
            }
            // Move lower views up
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.summary.text = links.descriptions[tag-1]
                for i in self.currentTag...self.max {
                    if (i < self.max) {
                        UIView.animate(withDuration: 0.2) {
                            self.views[i].center.y -= 192
                        }
                    }
                }
            }
            // Move lower views down
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                for i in tag...self.max {
                    if (i < self.max) {
                        UIView.animate(withDuration: 0.2) {
                            self.views[i].center.y += 192
                        }
                    }
                }
            }
            // Move footer below current view
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.footer.center.y = self.views[tag-1].center.y + 120
                UIView.animate(withDuration: 0.2) {
                    self.footer.alpha = 1.0
                }
                self.currentTag = tag
            }
        }
    }
    
    // Called when the "Visited" button is tapped
    @IBAction func visited(_ sender: Any) {
        UIView.animate(withDuration: 0.1, animations: {
            self.button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.button.transform = CGAffineTransform.identity
            }
        })
        UIView.animate(withDuration: 0.1, animations: {
            self.visited.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.visited.transform = CGAffineTransform.identity
            }
        })
        if (photos[currentTag-1].alpha < 0.5) {
            views[currentTag-1].bringSubviewToFront(labels[currentTag-1])
            photos[currentTag-1].alpha += 0.5
            counter += 1
            header.text = "States Visited: \(counter) / 50"
            // Update default configuration
            let defaults = UserDefaults.standard
            var tempArray = defaults.array(forKey: "keys")
            tempArray![currentTag-1] = 1
            defaults.set(tempArray, forKey: "keys")
        } else {
            views[currentTag-1].bringSubviewToFront(photos[currentTag-1])
            photos[currentTag-1].alpha -= 0.5
            counter -= 1
            header.text = "States Visited: \(counter) / 50"
            // Update default configuration
            let defaults = UserDefaults.standard
            var tempArray = defaults.array(forKey: "keys")
            tempArray![currentTag-1] = 0
            defaults.set(tempArray, forKey: "keys")
        }
    }
    
    @IBAction func airbnb(_ sender: UIImageView) {
        UIView.animate(withDuration: 0.1, animations: {
            self.airbnb.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.airbnb.transform = CGAffineTransform.identity
            }
        })
        let link: String = links.airbnbLinks[currentTag-1]
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func expedia(_ sender: Any) {
        UIView.animate(withDuration: 0.1, animations: {
            self.expedia.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.expedia.transform = CGAffineTransform.identity
            }
        })
        if let url = URL(string: "https://www.expedia.com") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func google(_ sender: Any) {
        UIView.animate(withDuration: 0.1, animations: {
            self.google.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.google.transform = CGAffineTransform.identity
            }
        })
        let link: String = links.googleLinks[currentTag-1]
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func wikipedia(_ sender: Any) {
        UIView.animate(withDuration: 0.1, animations: {
            self.wikipedia.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.wikipedia.transform = CGAffineTransform.identity
            }
        })
        let link: String = links.wikipediaLinks[currentTag-1]
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func minus(_ sender: Any) {
        UIView.animate(withDuration: 0.1, animations: {
            self.minus.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.minus.transform = CGAffineTransform.identity
            }
        })
        summary.font = summary.font?.withSize(summary.font!.pointSize - 1)
    }
    
    @IBAction func plus(_ sender: Any) {
        UIView.animate(withDuration: 0.1, animations: {
            self.plus.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.plus.transform = CGAffineTransform.identity
            }
        })
        summary.font = summary.font?.withSize(summary.font!.pointSize + 1)
    }
}
