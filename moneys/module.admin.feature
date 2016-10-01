@module
Feature:
  In a game, you can buy and sell elements.
  To pay or buy these elements you should have moneys.
  As an administrator, you should can create moneys, and as a gamer you should have several types of money.

  Background:
    Given I have signed up
    Given there is a game
    Given the game's slug is game1
    Given I load the module "moneys"
    Given I prepare a POST request on "/modules/{last_created_module}/render?game={last_created_game}"
    And the following headers:
      | Authorization | Bearer {my_api_token}             |
      | Content-Type  | application/x-www-form-urlencoded |

  Scenario: Successfully create a money
    Given I send the following body:
    """
    {
        "newMoney": {
            "name": "A money",
            "quantity": 1000,
            "picture": "blah"
        }
    }
    """
    When I send the request
    Then I should receive a 200 response
    Then it should be 1 element for this game
    And this element should have a property "isMoney" equal to "1"
    And this element should have a property "quantity" equal to 1000
    And this element should have a property "picture" equal to "blah"

    Scenario: Successfully remove a money
      Given I send the following body:
      """
      {
          "newMoney": {
              "name": "A money",
              "quantity": 1000,
              "picture": "blah"
          },
          "removeMoney": "A money"
      }
      """
      When I send the request
      Then I should receive a 200 response
      Then it should be 0 element for this game

      Scenario: Successfully edit a money
        Given this game has 1 element
        Given this element name is "A money"
        Given this element has a property named "isMoney" with value "1";
        Given I send the following body:
        """
        {
            "moneys": [
                {
                    "id": {last_created_element.id},
                    "name": "A new money",
                    "properties": [{
                        "name": "picture",
                        "value": "blah2"
                    },{
                        "name": "quantity",
                        "value": 1500
                    }]

                }
            ]
        }
        """
        When I send the request
        Then I should receive a 200 response
        Then it should be 1 element for this game
        And this element should have a property "isMoney" equal to "1"
        And this element should have "A new money" as "name"
        And this element should have a property "quantity" equal to 1500
        And this element should have a property "picture" equal to "blah2"