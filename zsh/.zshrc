# ── OH MY ZSH AYARLARI ───────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"

# Massivdə yalnız daxili git pluginini saxlayırıq ki, xəta verməsin
plugins=(git)



# Oh My Zsh mexanizmini başladırıq
source $ZSH/oh-my-zsh.sh

# ── SİSTEM PLUGİNLƏRİ (Məcburi çağırış) ──────────────────────────────────────
# Pacman ilə qurulan pluginləri birbaşa sistem qovluğundan aktiv edirik
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ── OH MY POSH (Spider-Man / Tokyo Night Kapsul Görünüşü) ──────────────────────
eval "$(oh-my-posh init zsh --config ~/.mytheme.omp.json)"


mc() {
    # 1. Pəncərəni float rejimə keçirmək üçün Hyprland əmri (hyprctl)
    hyprctl dispatch togglefloating active
    
    # 2. Pəncərəni mərkəzə gətiririk (estetik olması üçün)
    hyprctl dispatch centerwindow
    
    # 3. Ölçünü 50x11 etmək üçün escape kodu
    echo -ne "\e[8;11;50t"
    
    # 4. tty-clock-u işə salırıq
    tty-clock -c -C 4 -b -D
    
    # 5. Saatı bağlayandan sonra pəncərəni yenidən normal (tiled) rejimə qaytarırıq
    hyprctl dispatch togglefloating active
}

# ── ALIASES (Sürətli Qısayollar) ─────────────────────────────────────────────
alias v="nvim"
alias nv="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Neofetch işlədikdən sonra təmiz boşluq buraxmaq üçün alias
alias neofetch="neofetch && echo"


# Terminal açılanda avtomatik işə düşməsi üçün:
neofetch
echo
