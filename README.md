## IMPORTANT
This project has only just started, and in no way works...
Go look elsewhere for the time being :)

## Runter
Runter is a task runner for Ruby.
The general idea is it exposes a modular way of performing tasks when a file or file(s) in your project are modified.

# Usage
```
gem install runter
```

From there, you need to create a Runtfile in the root of your project, something like this:
```
{
  "watchers":[
    {
      "name": "libwatch",
      "src": ["lib/**/*"],
      "singleFileActions": [
        "echo 'Single Action: $1 was modified'"
      ],
      "bulkActions": [
        "echo 'Bulk Action: Runter detected some changes'"
      ]
    }
  ]
}
```

To start the monitor, type
```
runter
```

And that's it.  From there your actions will be executed as defined in your Runtfile!
