infile = open("서시.txt", "r", encoding="utf-8")
infile = open("별헤는밤.txt", "r", encoding="utf-8")
count = 0
for line in infile:
    line = line.rstrip()
    word_list = line.split()
    for word in word_list:
        count += 1
        print(word)
infile.close()
print("단어의 수는 ", count, "개 입니다.")
