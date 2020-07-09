import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import GroupNew from '../views/GroupNew.vue'
import GroupShow from '../views/GroupShow.vue'
import RoomIndex from '../views/RoomIndex.vue'
import Profile from '../views/Profile.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/',  name: 'Home', component: Home },
  { path: '/groups/new', name: 'GroupNew', component: GroupNew },
  { path: '/groups/:id/:name', name: 'GroupShow', component: GroupShow },
  { path: '/groups/:id/:day', name: 'RoomIndex', component: RoomIndex },
  { path: '/profile', name: 'Profile', component: Profile }
];

export default new VueRouter({ routes });