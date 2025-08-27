extends Node

var rank_order = {
	"1": 1, "2": 2, "3": 3, "4": 4, "5": 5,
	"6": 6, "7": 7, "8": 8, "9": 9,
	"10": 10, "J": 11, "Q": 12, "K": 13, "Ace": 14
}

func evaluate_hand(hand: Array) -> Dictionary:
	if hand.is_empty():
		return {"name": "empty", "points": 0}
	print("\n",hand,"\n")
	Global.turnsLeft-=1
	

	var ranks = []
	var suits = []
	for card in hand:
		suits.append(card[0]) 
		ranks.append(rank_order[card[1]]) 
	ranks.sort()

	var counts = {}
	for r in ranks:
		counts[r] = counts.get(r, 0) + 1

	var unique_counts = counts.values()
	unique_counts.sort()

	var is_flush = hand.size() == 5 and suits.count(suits[0]) == suits.size()
	var is_straight = hand.size() == 5 and ranks[-1] - ranks[0] == 4 and counts.size() == 5
	var is_royal = is_straight and ranks[0] == 10

	if is_flush and is_royal:
		return {"name": "Royal Flush", "points": 200}
	elif is_flush and is_straight:
		return {"name": "Straight Flush", "points": 150}
	elif 4 in unique_counts:
		return {"name": "Four of a Kind", "points": 100}
	elif 3 in unique_counts and 2 in unique_counts:
		return {"name": "Full House", "points": 50}
	elif is_flush:
		return {"name": "Flush", "points": 25}
	elif is_straight:
		return {"name": "Straight", "points": 12}
	elif 3 in unique_counts:
		return {"name": "Three of a Kind", "points": 6}
	elif unique_counts.count(2) == 2:
		return {"name": "Two Pair", "points": 3}
	elif 2 in unique_counts:
		return {"name": "One Pair", "points": 2}
	else:
		return {"name": "High Card", "points": 1}
