#!/bin/bash

filetmp="out/tmp.md"
combined="out/combined.md"
title="Вопросы для подготовки"
book="QA"

# Создаем итоговый файл с заданным заголовком первого уровня
echo "# $title" > $filetmp

# Явно задаем порядок и список файлов
files=(
  "Q-JavaCore.md"
  "Q-OOP.md"
  "Q-String.md"
  "Q-Enum.md"
  "Q-FunctionalInterfaces.md"
  "Q-StreamAPI.md"
  "Q-Collections.md"
  "Q-ClassObject-EqualsAndHashCode.md"
  "Q-Exceptions.md"
  "Q-Memory.md"
  "Q-Multithreading.md"
  "Q-Databases.md"
  "Q-Spring.md"
  "Q-SpringBoot.md"
  "Q-SpringData.md"
)

# Обрабатываем каждый markdown-файл (кроме итогового)
for file in "${files[@]}"; do
  # Добавляем разделитель между файлами (теперь - разделами)
  echo -e "\n" >> $filetmp

  # Понижаем уровень всех заголовков
  sed -E '
    s/^(#+) /#\1 /g
  ' "$file" | sed '/./,$!d' >> $filetmp
done

# Удаляем лишние пустые строки и т.п.
cat $filetmp | sed '/^$/{N; /\n$/D}' > $combined
rm $filetmp

pandoc $combined -T "$title" --metadata title="$title" -o "out/$book.html"
pandoc $combined -T "$title" --metadata title="$title" -o "out/$book.fb2"
pandoc $combined -T "$title" --metadata title="$title" -o "out/$book.epub"
