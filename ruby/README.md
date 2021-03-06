
## Requirement

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you).

## Approach

My initial approach was to get the gilded_rose class into manageable OO code.

#### Refactoring

In order to do this I first set up feature tests on the GildedRose and Item classes which tested that each requirement from the current spec was tested.

Also and prior to refactoring I ran the existing texttest_fixture and saved a copy in /docs - after refactoring I ran it again so output could be compared and there is evidence that the refactor has worked and that my unit tests stand up.

I refactored Item by breaking it first into a general case ItemGeneralCase which inherits from Item. Subsequently I used polymorphism, creating a new class for each distinct set of rules each of which inherit from my new ItemGeneralCase class.

#### Adding the Conjure functionality

I used TDD to create the new functionality creating unit tests for each of the new classes

#### Improvements to approach

* Whilst refactoring I created 4 new classes inheriting from Item. I used the feature testing that I had built up to prove that the classes were valid. I omitted to create unit tests for the new classes - this was a mistake.

* I have tested state more than behaviour. Perhaps think harder about this

## How to run rspec Tests

```
git clone https://github.com/philb56/GildedRose-Refactoring-Kata.git
cd ruby
bundle install
rspec
```
## How to run existing Tests

```
cd ruby
ruby './texttest_fixture.rb' 10 > test_results_10_days.txt
ruby './gilded_rose_tests.rb'
```

## Test cases

#### General
* Once the sell by date has passed, Quality degrades twice as fast
* The Quality of an item is never negative
* The Quality of an item is never more than 50

#### Product specific
* “Aged Brie” actually increases in Quality the older it gets
* “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
* “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

## rubocop

* passes with no offenses

the following files have been excluded from rubocop
* ./texttest_fixture.rb - need to prove that this produces the same before and after
* ./lib/item.rb' - fear of the goblin

## To do
* add unit testing of existing functionality on new classes
* add more boundary cases for new functionality
* find a compare facility for before and after results from texttest_fixture.rb and document this in the README
* Consider: test behaviour not state. Perhaps that is why there is a to_s method on Item
