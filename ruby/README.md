
## How to run rpsec Tests

```
git clone https://github.com/philb56/GildedRose-Refactoring-Kata.git
cd ruby
bundle install
rspec
```
## How to run existing Tests

```cd ruby
ruby './texttest_fixture.rb' 10 > test_results_10_days.txt
ruby './gilded_rose_tests.rb'
```

## Test cases

#### General
* Once the sell by date has passed, Quality degrades twice as fast
* The Quality of an item is never negative
* The Quality of an item is never more than 50

#### Product specific
* “Aged Brie” vactually increases in Quality the older it gets
* “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
* “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
