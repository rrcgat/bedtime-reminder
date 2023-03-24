# Bedtime Reminder

If you tend to work too hard and forget to sleep, it could harm your health. That's why you might need a reminder to help you get to bed on time. This bedtime reminder is designed to work on Linux systems with systemd.

## Usage

First, clone this repository to your computer, for example, to ~/repo. Then, edit the bedtime-reminder.sh file. There are four variables that you can adjust to suit your needs:

1. `notify_bedtime`: This variable specifies the start time for notifications.
2. `bedtime`: This variable sets the bedtime, and triggers a critical notification.
3. `suspend_time`: This variable specifies the latest bedtime, after which the system will be suspended.
4. `lock_wait_time`: This variable determines how long the system should wait before suspending, once the `suspend_time` has been reached.

Once you've modified the variables to your liking, create a new directory for your user timers:

```shell
mkdir -p ~/.config/systemd/user/
```

Then, copy the bedtime-reminder.service and bedtime-reminder.timer files to ~/.config/systemd/user. Edit the bedtime-reminder.service file, and replace /home/user/repo/bedtime-reminder/bedtime-reminder.sh with the real path to your script.

Finally, start and enable the timer:

```shell
systemctl --user start bedtime-reminder.timer
systemctl --user enable bedtime-reminder.timer
```

That's it! The timer will now remind you to go to bed at the specified times, and will suspend your system if you stay up too late.
