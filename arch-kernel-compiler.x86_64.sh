#!/bin/bash

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Language/Język:"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

# Options
PS3='Please enter your choice: '
options=("English (en)" "Polski (pl)" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "English (en)")
        while :
        do
            clear
            cat<<EOF
            ==============================
            Arch Linux Kernel Compiler's (ABS) menu
            ------------------------------
            Welcome to the Arch Linux Kernel Compiler's (ABS) script!
            Please do everything in the order (1-6)

            Please enter your choice:

            Install base-devel and asp (1)
            Edit multiprocessing in makepkg config file (2)
            Fetch the kernel package files from ABS (3)
            Edit PKGBUILD (4)
            Kernel configuration (5)
            Compile the kernel (6)
                   (Q)uit

            Author: Daria Szatan (bla-ke)
            License: MIT License
            ------------------------------

EOF
            read -n1 -s
            case "$REPLY" in
            "1")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Do you want to install base-devel and asp?"
            echo "^^^^^^ (You need them to compile your kernel)"
            echo "^^^^^^ [Y - Yes, N - No]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Installing needed packages..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sudo pacman -Sy
              sudo pacman -S --needed base-devel asp

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Done!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Aborted!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "2")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Do you want to let the script edit your file /etc/makepkg.conf?"
            echo "^^^^^^ [Y - Yes, N - No]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Reading your number of cores..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              CORE=$(nproc)

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Done!"
              echo "^^^^^^ Number of cores: $CORE"
              echo "^^^^^^ Editing /etc/makepkg.conf file..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sudo bash -c 'cat <<EOT >> '/etc/makepkg.conf'
              MAKEFLAGS="$CORE"
              EOT'

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Done!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Aborted!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "3")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Do you want to fetch the kernel package files from ABS?"
            echo "^^^^^^ (You need them to compile your kernel)"
            echo "^^^^^^ [Y - Yes, N - No]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Fetching the kernel package files..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              asp update linux && asp checkout linux

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Done!"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Aborted!"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "4")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Do you want to edit the package name?"
            echo "^^^^^^ [Y - Yes, N - No]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ You need to edit the value of 'pkgbase'"
              echo "^^^^^^ Executing nano in 5 seconds..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 5

              cwd=$(pwd)

              nano $cwd/linux/repos/core-x86_64/PKGBUILD

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Done!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Aborted!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "5")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Do you want to edit the kernel configuration manually?"
            echo "^^^^^^ [Y - Yes, N - No]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Editing the kernel configuration via nano..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

              cwd=$(pwd)

              nano $cwd/linux/repos/core-x86_64/config

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Done!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Aborted!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "6")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Do you want to compile the kernel?"
            echo "^^^^^^ (It can take a lot of time)"
            echo "^^^^^^ [Y - Yes, N - No]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Importing public GPG keys..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              gpg --recv-keys 79BE3E4300411886 38DBBDC86092693E

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Compiling the kernel..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              cd linux/repos/core-x86_64/ && makepkg -si

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Done!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Aborted!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "Q")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Exiting..."
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            sleep 1

            break

            ;;
            "q")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Exiting..."
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            sleep 1

            break

            ;;
          esac
        done

        break

        ;;

        "Polski (pl)")
        while :
        do
            clear
            cat<<EOF
            ==============================
            Arch Linux Kernel Compiler's (ABS) menu
            ------------------------------
            Witaj w skrypcie Arch Linux Kernel Compiler (ABS)!
            Proszę wykonywać polecenia według kolejności (1-6) (1-6)

            Proszę wprowadzić swój wybór:

            Zainstaluj base-devel i asp (1)
            Edytuj plik konfiguracyjny makepkg, aby włączyć wielordzeniowość (2)
            Wyodrębnij pliki pakietu jądra z ABS (3)
            Edytuj PKGBUILD (4)
            Konfiguruj (5)
            Kompiluj jądro (6)
                   (W)yjdź

            Autor: Daria Szatan (bla-ke)
            Licencja: MIT
            ------------------------------

EOF
            read -n1 -s
            case "$REPLY" in
            "1")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Czy chcesz zainstalować base-devel i asp?"
            echo "^^^^^^ (Potrzebne do kompilacji jądra)"
            echo "^^^^^^ [T - Tak, N - Nie]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "t" || $confirmation == "T" || $confirmation == "tak" || $confirmation == "Tak" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Instalowanie wymaganych pakietów..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sudo pacman -Sy
              sudo pacman -S --needed base-devel asp

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Zrobione!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Przerwane!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "2")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Czy zezwolić skryptowi na edycję pliku /etc/makepkg.conf?"
            echo "^^^^^^ [T - Tak, N - Nie]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "t" || $confirmation == "T" || $confirmation == "tak" || $confirmation == "Tak" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Odczytywanie liczby rdzeni procesora..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              CORE=$(nproc)

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Zrobione!"
              echo "^^^^^^ Liczba rdzeni: $CORE"
              echo "^^^^^^ Edytowanie pliku /etc/makepkg.conf..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sudo bash -c 'cat <<EOT >> '/etc/makepkg.conf'
              MAKEFLAGS="$CORE"
              EOT'

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Zrobione!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Przerwane!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "3")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Czy chcesz wyodrębnić pliki pakietu jądra z ABS?"
            echo "^^^^^^ (Potrzebne do kompilacji jądra)"
            echo "^^^^^^ [T - Tak, N - Nie]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "t" || $confirmation == "T" || $confirmation == "tak" || $confirmation == "Tak" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Wyodrębnianie plików pakietu jądra..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              asp update linux && asp checkout linux

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Zrobione!"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Przerwane!"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "4")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Czy chcesz edytować nazwę pakietu?"
            echo "^^^^^^ [T - Tak, N - Nie]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "t" || $confirmation == "T" || $confirmation == "tak" || $confirmation == "Tak" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Musisz zmienić wartość parametru 'pkgbase'"
              echo "^^^^^^ Wykonywanie komendy nano w ciągu 5 sekund..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 5

              cwd=$(pwd)

              nano $cwd/linux/repos/core-x86_64/PKGBUILD

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Zrobione!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Przerwane!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "5")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Czy chcesz edytować ręcznie konfigurację jądra?"
            echo "^^^^^^ [T - Tak, N - Nie]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "t" || $confirmation == "T" || $confirmation == "tak" || $confirmation == "Tak" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Edytowanie konfiguracji jądra za pomocą nano..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

              cwd=$(pwd)

              nano $cwd/linux/repos/core-x86_64/config

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Zrobione!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Przerwane!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "6")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Czy chcesz skompilować jądro?"
            echo "^^^^^^ (Proces może zająć dużo czasu)"
            echo "^^^^^^ [T - Tak, N - Nie]"
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            read confirmation

            if [[ $confirmation == "t" || $confirmation == "T" || $confirmation == "tak" || $confirmation == "Tak" ]]; then
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Importowanie publicznych kluczy GPG"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              gpg --recv-keys 79BE3E4300411886 38DBBDC86092693E

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Kompilowanie jądra..."
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              cd linux/repos/core-x86_64/ && makepkg -si

              sleep 1

              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Zrobione!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            else
              echo ""
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^"
              echo "^^^^^^ Przerwane!"
              echo "^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
              echo ""

              sleep 1

            fi

            ;;
            "W")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Wychodzenie..."
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            sleep 1

            break

            ;;
            "w")
            echo ""
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^"
            echo "^^^^^^ Wychodzenie..."
            echo "^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo ""

            sleep 1

            break

            ;;
          esac
        done

        break

        ;;

        "Quit")
        echo ""
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^"
        echo "^^^^^^ Exiting..."
        echo "^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo ""

        sleep 1

        break
      esac
    done
