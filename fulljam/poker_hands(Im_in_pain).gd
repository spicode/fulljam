extends Node

var rank_order = {"1":1,
	"2": 2, "3": 3, "4": 4, "5": 5,
	"6": 6, "7": 7, "8": 8, "9": 9,
	"10": 10, "J": 11, "Q": 12, "K": 13, "Ace": 14
}

func evaluate_hand(hand: Array) -> String:
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
	var is_flush = suits.count(suits[0]) == suits.size()
	var is_straight = ranks.size() == 5 and ranks[-1] - ranks[0] == 4 and counts.size() == 5
	var is_royal = is_straight and ranks[0] == 10
	if is_flush and is_royal:
		return "Royal Flush"
	elif is_flush and is_straight:
		return "Straight Flush"
	elif 4 in unique_counts:
		return "Four of a Kind"
	elif 3 in unique_counts and 2 in unique_counts:
		return "Full House"
	elif is_flush:
		return "Flush"
	elif is_straight:
		return "Straight"
	elif 3 in unique_counts:
		return "Three of a Kind"
	elif unique_counts.count(2) == 2:
		return "Two Pair"
	elif 2 in unique_counts:
		return "One Pair"
	else:
		return "High Card"
