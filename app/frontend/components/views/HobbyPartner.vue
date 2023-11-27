<template>
  <div>
    <button class="button is-warning" @click="findHobbyPartners">
      Find {{ matchedUser ? 'another' : '' }} Hobby Partner
    </button>
    <div v-if="buttonClicked && matchedUser" class="mt-5">
      <h2>{{ [matchedUser.first_name, matchedUser.last_name].join(' ') }}</h2>
    </div>
    <div v-if="buttonClicked && !matchedUser" class="mt-5">
      <p>No matching hobby partner found.</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      buttonClicked: false,
      matchedUser: null,
    };
  },
  methods: {
    findHobbyPartners() {
      this.buttonClicked = true;

      fetch('/users/find_hobby_partners')
        .then(response => response.json())
        .then(data => {
          this.matchedUser = data;
        })
        .catch(error => {
          console.error('Error fetching hobby partner:', error);
        });
    },
  },
};
</script>

<style scoped>
</style>
