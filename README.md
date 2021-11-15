Create a branch off of your Sweater Weather project called "final"
As you work, you should commit to this branch every 15 minutes.
DO NOT push your code to your GitHub repo until the end of the 3 hour assessment, unless otherwise directed by instructors
Complete the user story below. You should:
TDD all of your work
Prioritize getting your code functional before attempting any refactors
Write/refactor your code to achieve good code quality


Assignment:
You will be using the Bored API to find activities once you read a destination city provided by the user. Presume that your user will give a known "good" location. (you can handle edge cases later)

Your endpoint should follow this format:
GET /api/v1/activities?destination=chicago,il
please do not deviate from the names of the endpoint or query parameter, be sure it is called "activities" and "destination", respectively

Your API will return:
the destination city
the forecast in that city right now
Two activities that would be suitable given the weather:
for all temperatures, include one relaxation activity
if the temperature is >= 60 F, include one recreational activity.
if the temperature is >= 50 F and < 60 F, include one busywork activity.
if the temperature is < 50 F, include one cooking activity.

Your response should be in the format below:
{
  "data": {
    "id": "null",
    "type": "activities",
    "attributes": {
      "destination": "chicago,il",
      "forecast": {
        "summary": "Cloudy with a chance of meatballs",
        "temperature": "45 F"
      },
      "activities": {
        "Learn a new recipe": {
          "type": "cooking",
          "participants": 1,
          "price": 0
        },
        "Take a bubble bath": {
          "type": "relaxation",
          "participants": 1,
          "price": 0.5
        }
      }
    }
  }
}

