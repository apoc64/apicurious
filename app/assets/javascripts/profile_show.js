const tabBar = document.querySelector('.tabs')
M.Tabs.init(tabBar, {});

function followerTabPress() {
  const followerIndex = document.querySelector('.followers-index')
  starData = fetch(`https://api.github.com/users/${login}/followers?access_token=${token}`)
  .then(response => response.json())
    .then(function(response) {
      response.forEach( follower => {
        var newDiv = document.createElement('div')
        followerIndex.appendChild(newDiv)
        newDiv.innerHTML = `<a href="/users/${follower["login"]}">${follower["login"]}</a>`
      })
      followerIndex.style.display = 'block'
    })
}

function followingTabPress() {
  const followingIndex = document.querySelector('.following-index')
  starData = fetch(`https://api.github.com/users/${login}/following?access_token=${token}`)
  .then(response => response.json())
    .then(function(response) {
      response.forEach( followed => {
        var newDiv = document.createElement('div')
        followingIndex.appendChild(newDiv)
        newDiv.innerHTML = `<a href="/users/${followed["login"]}">${followed["login"]}</a>`
      })
      followingIndex.style.display = 'block'
    })
}

const tabs = document.querySelectorAll('.tab')
tabs.forEach(tab => {
  tab.addEventListener('click', function() {
    var repos = document.querySelectorAll('.main-display')
    repos.forEach(repo => {
      repo.style.display = 'none'
    })
    switch (this.id) {
      case 'overview':
        const overs = document.querySelectorAll('.overview')
        overs.forEach(over => {
          over.style.display = 'inherit'
        })
        break;
      case 'repos':
        const repoIndex = document.querySelector('.repo-index')
        repoIndex.style.display = 'block'
        break;
      case 'followers':
        followerTabPress()
        break;
      case 'following':
        followingTabPress()
        break;
      default:
    }
  })
})
