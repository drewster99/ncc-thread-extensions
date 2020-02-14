# NCCThreadExtensions

Provides an extension to iOS and macOS's "Thread" class to run a closure on the main thread.

Instead of this:

    if Thread.isMainThread {
        nameLabel.text = "Andrew"
        nameLabel.textColor = .red
        nameLabel.backgroundColor = .black
    } else {
        DispatchQueue.main.sync {
            nameLabel.text = "Andrew"
            nameLabel.textColor = .red
            nameLabel.backgroundColor = .black
        }
    }


You can do this:
    
    Thread.onMain {
        nameLabel.text = "Andrew"
        nameLabel.textColor = .red
        nameLabel.backgroundColor = .black
    }
        
You can also have return values, like this:
        
        let currentName = Thread.onMain {
            return nameLabel.text ?? "<no name>"
        }

That's it.
