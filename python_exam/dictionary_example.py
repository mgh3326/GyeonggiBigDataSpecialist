english_dict = dict()
english_dict['one'] = '하나'
english_dict['two'] = '둘'
english_dict['three'] = '셋'
english_dict['apple'] = '사과'
english_dict['victory'] = '승리'
english_dict['love'] = '사랑'

word = input("단어를 입력하시오: ")
print(english_dict.get(word, "없어요"))
