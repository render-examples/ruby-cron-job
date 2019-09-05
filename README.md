# Ruby Cron Job

This is a simple Ruby cron job example for [Render](https://render.com).

## Deployment

Fork this repo on Render and create a new **Cron Job** using your new repo and the following values:

   | Field      |  Value    |
   | ---------- | --------- |
   | **Environment** | `Ruby` |
   | **Build Command** | `bundle install` |

Set the schedule to run your command once every five minutes. See [cron expressions](https://en.wikipedia.org/wiki/Cron#CRON_expression) for the schedule format.

   | Field      |  Value    |
   | ---------- | --------- |
   | **Schedule** | `*/5 * * * *` |
   | **Command** | `bundle exec ruby main.rb` |

Save your cron job and that's it! Your command will now run every five minutes and print `Hello World from Render!` in the logs.
