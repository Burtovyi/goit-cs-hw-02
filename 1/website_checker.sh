
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

for site in "${websites[@]}"; do
    status_code=$(curl -Is "$site" | head -n 1 | awk '{print $2}')

    if [ "$status_code" == "200" ] || [ "$status_code" == "301" ]; then
        echo "$site is UP" >> "$log_file"
    else
        echo "$site is DOWN" >> "$log_file"
    fi
done

echo "Результати перевірки доступності вебсайтів записані у файл $log_file"
